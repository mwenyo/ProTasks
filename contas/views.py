from django.shortcuts import render, redirect, get_object_or_404
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib import messages

from django.contrib.auth import (
	authenticate,
	get_user_model,
	login,
	logout,
	update_session_auth_hash
)

from .forms import *

User = get_user_model()

def login_view(request):
	if not request.user.is_authenticated:
		next = request.GET.get('next')
		form = UserLoginForm(request.POST or None)
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			login(request, user)
			if next:
				return HttpResponseRedirect(next)
			return HttpResponseRedirect('/')

		context = {
			'form': form,
		}
		return render(request, "contas/login.html", context)
	return HttpResponseRedirect('/')


def register_view(request):
	if not request.user.is_authenticated:
		next = request.GET.get('next')
		form = UserRegisterForm(request.POST or None)
		if form.is_valid():
			user = form.save(commit=False)
			password = form.cleaned_data.get('password')
			user.set_password(password)
			user.save()
			new_user = authenticate(username=user.username, password=password)
			login(request, new_user)
			if next:
				return HttpResponseRedirect(next)
			return HttpResponseRedirect('/')

		context = {
			'form': form,
		}
		return render(request, "contas/registrar.html", context)
	else:
		return HttpResponseRedirect('/')


def logout_view(request):
	logout(request)
	return HttpResponseRedirect('/')

@login_required(login_url='contas/login/')
def change_view(request, codigo):
	usuario = get_object_or_404(User, id=codigo)
	form = UserChangeForm(request.POST or None, instance=usuario)
	if form.is_valid():

		old_user = get_object_or_404(User, id=codigo)
		new_email = form.cleaned_data['email']
		if not User.objects.filter(email=new_email).exclude(email=old_user.email).exists():
			user = form.save(commit=False)
			user.save()
			return HttpResponseRedirect('/')
		else:
			messages.error(request, "Este email já está registrado para outro usuário.")
			context = {
				'form': form,
			}
			return render(request, "contas/alterar_cadastro.html", context)
	context = {
		'form': form,
	}
	return render(request, "contas/alterar_cadastro.html", context)

@login_required(login_url='contas/login/')
def change_password_view(request, codigo):
	usuario = get_object_or_404(User, id=codigo)
	form = UserChangePassWordForm(request.POST or None)
	if form.is_valid():
		old_password = form.cleaned_data['old_password']
		new_password = form.cleaned_data['password']
		if usuario.check_password(old_password):
			usuario.set_password(new_password)
			usuario.save()
			update_session_auth_hash(request, usuario)
			return HttpResponseRedirect('/')
		else:
			messages.error(request, "Senha incorreta.")
			context = {
				'form': form,
			}
			return render(request, "contas/alterar_senha.html", context)
	context = {
		'form': form,
	}
	return render(request, "contas/alterar_senha.html", context)