from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from turmas.models import *
from .forms  import *
from .models import *

# Create your views here.

@login_required(login_url='/admin/login/')
def index(request):
	atividades = Atividade.objects.order_by('data_comentario')
	context = {
		'atividades': atividades,
	}
	k = Prioridade.objects.filter(aluno=request.user, atividade=atividade)
	if k:
		context['prioridade'] = True
	else:
		context['prioridade'] = False
	return render(request, 'atividades/index.html', context)

@login_required(login_url='/admin/login/')
def atividade(request, codigo):
	atividade = get_object_or_404(Atividade, pk=codigo)
	comentarios = Comentario.objects.filter(atividade=atividade).\
		order_by('data_comentario')
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
	oAtividade = get_object_or_404(Atividade, pk=atividade)
	if request.method == 'POST':
		form = ComentarioForm(request.POST)
		if form.is_valid():
			try:
				comentario = Comentario(aluno=request.user, atividade=oAtividade, \
					comentario=form.cleaned_data['comentario'])
				comentario.save()
				return HttpResponseRedirect('/atividades/' + str(atividade) + '/')
			except:
				return render(request, 'atividades/comentar.html', {'form' : form, \
					'erro':'Atividade inválida.'})
		else:
			return render(request, 'atividades/comentar.html', {'form' : form, \
				'erro':'Seu formulário ccontém erros.'})
	else:
		try:
			form = ComentarioForm()
			return render(request, 'atividades/comentar.html', {'form' : form, \
				'atividade': oAtividade})
		except:
			return render(request, 'atividades/comentar.html', {'form' : form, \
				'erro':'Atividade inválida.'})

@login_required(login_url='/admin/login/')
def cadastrar(request, codigo):
	if request.method == 'POST':
		form = AtividadeForm(request.POST)
		if form.is_valid():
			aet = AlunoEmTurma.objects.filter(turma__codigo=codigo, aluno=request.user).exist()
			if aet:	
				turma = get_object_or_404(Turma, codigo=codigo)
				nova_atividade = Atividade(
					aluno = request.user,
					turma = turma,
					atividade = form.cleaned_data['atividade'],
					disciplina = form.cleaned_data['disciplina'],
					valor = form.cleaned_data['valor'],
					data_entrega = form.cleaned_data['data_entrega'],
					observacoes = form.cleaned_data['observacoes'],
					)
				nova_atividade.save()
				return HttpResponseRedirect('/' + nova_atividade.codigo)
			else:
				return HttpResponseRedirect('')
		else:
			return render(request, 'atividades/form.html', {'form' : form})
	else:
		form = AtividadeForm()
		turma = get_object_or_404(Turma, codigo=codigo)
		return render(request, 'atividades/form.html', {'form' : form, 'turma': turma})