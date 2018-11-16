from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.db.models import Count
from django.contrib.auth.models import User
from .models import *
from .forms import *

# Create your views here.

@login_required(login_url='/admin/login/')
def turma_index(request):
	ultimas_turmas = AlunoEmTurma.objects.filter(aluno=request.user).order_by('-data_cadastro')
	solicitacoes = Solicitacao.objects.filter(aluno=request.user)
	context = {
		'ultimas_turmas': ultimas_turmas,
		'solicitacoes': solicitacoes,
	}
	return render(request, 'turmas/index.html', context)

@login_required(login_url='/admin/login/')
def turma_detalhes(request, codigo):
	aem = AlunoEmTurma.objects.filter(aluno__id=request.user.id, turma__codigo=codigo).exists()
	if aem:
	    turma = get_object_or_404(Turma, codigo=codigo)
	    atividades = Atividade.objects.filter(turma=turma).\
	    	order_by('encerrada','prioridade__atividade','data_entrega',).distinct()
	    alunos = AlunoEmTurma.objects.filter(turma=turma).exclude(aluno=turma.aluno)
	    solicitacoes = Solicitacao.objects.filter(turma__codigo=codigo)
	    context = {
	    	'turma' : turma,
	    	'lista_atividades': atividades,
	    	'alunos': alunos, 
	    	'solicitacoes' : solicitacoes,
	    }

	    return render(request, 'turmas/detalhe.html', context)
	else:
		return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def turma_solicitar(request):
	if request.method == 'POST':
		form = JoinTurma(request.POST)
		if form.is_valid():
			try:
				turma = Turma.objects.get(codigo=form.cleaned_data['codigo'])
				membro = Solicitacao(aluno=request.user, turma=turma)
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

@login_required(login_url='/admin/login/')
def turma_cadastrar(request):
	if request.method == 'POST':
		form = TurmaForm(request.POST)
		if form.is_valid():
			nova_turma = Turma(
				aluno = request.user,
				nome = form.cleaned_data['nome'],
				curso = form.cleaned_data['curso'],
				ano = form.cleaned_data['ano'],
				turno = form.cleaned_data['turno'],
				)
			nova_turma.save()
			alunoEmTurma = AlunoEmTurma(turma=nova_turma, aluno=request.user)
			alunoEmTurma.save()
			return HttpResponseRedirect('/' + nova_turma.codigo)
		else:
			return render(request, 'turmas/form.html', {'form' : form, 'edit' : False})
	else:
		form = TurmaForm()
		return render(request, 'turmas/form.html', {'form' : form, 'edit' : False})

@login_required(login_url='/admin/login/')
def turma_excluir(request, codigo):
	turma = get_object_or_404(Turma, codigo=codigo)
	if turma.aluno.id == request.user.id:
		if request.method == 'POST':
			turma.delete()
			return HttpResponseRedirect('/')
		else:
			return HttpResponseRedirect('/' + turma.codigo)
	else:
		return HttpResponseRedirect('/' + turma.codigo)

@login_required(login_url='/admin/login/')
def turma_editar(request, codigo):
	turma = get_object_or_404(Turma, codigo=codigo)
	if turma.aluno.id == request.user.id:
		if request.method == 'POST':
			form = TurmaForm(request.POST, instance=turma)
			if form.is_valid():
				nova_turma = form.save(commit=False)
				nova_turma.aluno = request.user
				nova_turma.save()
				return HttpResponseRedirect('/' + nova_turma.codigo)
			else:
				return render(request, 'turmas/form.html', {'form' : form, 'edit' : True})
		else:
			form = TurmaForm(instance=turma)
			return render(request, 'turmas/form.html', {'form' : form, 'turma' : turma, 'edit' : True})
	else:
		return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def remover_aluno(request, aem):
	vinculo = get_object_or_404(AlunoEmTurma, id=aem)
	if vinculo.turma.aluno.id == request.user.id or vinculo.aluno.id == request.user.id:
		if request.method == 'POST':
			vinculo.delete()
			return HttpResponseRedirect('/')
		else:
			return HttpResponseRedirect('/' + vinculo.turma.codigo)
	else:
		return HttpResponseRedirect('/' + vinculo.turma.codigo)

@login_required(login_url='/admin/login/')
def remover_solicitacao(request, codigo):
	solicitacao = get_object_or_404(Solicitacao, id=codigo)
	turma = solicitacao.turma
	if (solicitacao.turma.aluno.id == request.user.id) or (solicitacao.aluno.id == request.user.id):
		solicitacao.delete()
		return HttpResponseRedirect('/' + turma.codigo)
	else:
		return HttpResponseRedirect('/' + turma.codigo)

@login_required(login_url='/admin/login/')
def aceitar_solicitacao(request, codigo):
	solicitacao = get_object_or_404(Solicitacao, id=codigo)
	turma = solicitacao.turma
	if solicitacao.turma.aluno.id == request.user.id:
		aem = AlunoEmTurma(turma=solicitacao.turma, aluno=solicitacao.aluno)
		aem.save()
		solicitacao.delete()
		return HttpResponseRedirect('/' + turma.codigo)
	else:
		return HttpResponseRedirect('/' + turma.codigo)