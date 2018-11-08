from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.db.models import Count
from django.contrib.auth.models import User
from .models import *
from .forms import *

# Create your views here.

@login_required(login_url='/admin/login/')
def index(request):
	ultimas_turmas = AlunoEmTurma.objects.filter(aluno=request.user).order_by('-data_cadastro')
	context = {
		'ultimas_turmas': ultimas_turmas,
	}
	return render(request, 'turmas/index.html', context)

@login_required(login_url='/admin/login/')
def turma(request, codigo):
    turma = get_object_or_404(Turma, codigo=codigo)
    context = {
    	'turma' : turma,
    }
    return render(request, 'turmas/detalhe.html', context)

@login_required(login_url='/admin/login/')
def join(request):
	if request.method == 'POST':
		form = JoinTurma(request.POST)
		if form.is_valid():
			try:
				turma = Turma.objects.get(codigo=form.cleaned_data['codigo'])
				membro = AlunoEmTurma(aluno=request.user, turma=turma)
				check = AlunoEmTurma.objects.filter(aluno=request.user, turma=turma).exists()
				if not check:
					membro.save()
					return HttpResponseRedirect('/')
				else:
					return render(request, 'turmas/join.html', {'form' : form, 'erro':'Você já faz parte dessa turma.'})
			except:
				return render(request, 'turmas/join.html', {'form' : form, 'erro':'Código inválido.'})
		else:
			return render(request, 'turmas/join.html', {'form' : form, 'erro':'bugou'})
	else:
		form = JoinTurma()
		return render(request, 'turmas/join.html', {'form' : form})