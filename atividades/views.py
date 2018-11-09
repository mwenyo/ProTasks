from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from .forms  import ComentarioForm
from .models import *

# Create your views here.

@login_required(login_url='/admin/login/')
def index(request):
	atividades = Atividade.objects.order_by('data_comentario')
	context = {
		'atividades': atividades,
	}
	check = Prioridade.objects.filter(aluno=request.user, atividade=atividade)
	print(check)
	if check:
		context['prioridade'] = True
	else:
		context['prioridade'] = False
	return render(request, 'atividades/index.html', context)

@login_required(login_url='/admin/login/')
def atividade(request, codigo):
	atividade = get_object_or_404(Atividade, pk=codigo)
	comentarios = Comentario.objects.filter(atividade=atividade).order_by('data_comentario')
	if atividade.expirou and atividade.encerrada == False:
		atividade.encerrada = True
		atividade.save()
	context = {
		'atividade' : atividade,
		'comentarios': comentarios
	}
	
	check = Prioridade.objects.filter(aluno=request.user, atividade=atividade)
	if check:
		context['prioridade'] = True
	else:
		context['prioridade'] = False

	return render(request, 'atividades/detalhe.html', context)

@login_required(login_url='/admin/login/')
def prioridade(request, codigo):
	try:
		atividade = get_object_or_404(Atividade, pk=codigo)
		check = Prioridade.objects.filter(aluno=request.user, atividade=atividade)
		if check:
			check.delete()
			return HttpResponseRedirect('/atividades/' + str(atividade.id) + '/')
		else:
			check = Prioridade(aluno=request.user, atividade=atividade)
			check.save()
			return HttpResponseRedirect('/atividades/' + str(atividade.id) + '/')
	except:
		return HttpResponseRedirect('/atividades/' + str(atividade.id) + '/')

@login_required(login_url='/admin/login/')
def comentar(request, atividade):
	if request.method == 'POST':
		form = ComentarioForm(request.POST)
		if form.is_valid():
			try:
				oAtividade = get_object_or_404(Atividade, pk=atividade)
				comentario = Comentario(aluno=request.user, atividade=oAtividade, comentario=form.cleaned_data['comentario'])
				comentario.save()
				return HttpResponseRedirect('/atividades/' + str(atividade) + '/')
			except:
				return render(request, 'atividades/comentar.html', {'form' : form, 'erro':'Atividade inválida.'})
		else:
			return render(request, 'atividades/comentar.html', {'form' : form, 'erro':'Seu formulário ccontém erros.'})
	else:
		try:
			form = ComentarioForm()
			oAtividade = get_object_or_404(Atividade, pk=atividade)
			return render(request, 'atividades/comentar.html', {'form' : form, 'atividade': oAtividade})
		except:
			return render(request, 'atividades/comentar.html', {'form' : form, 'erro':'Atividade inválida.'})