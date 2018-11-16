from django.shortcuts import render, get_object_or_404
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from datetime import datetime
from turmas.models import *
from .forms  import *
from .models import *

# Create your views here.
"""
@login_required(login_url='/admin/login/')
def atividade_index(request):
	aem = AlunoEmTurma.objects.filter(aluno__id=request.user.id, turma__codigo=codigo).exists()
	if aem:
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
	else:
		return HttpResponseRedirect('')"""

@login_required(login_url='/admin/login/')
def atividade_detalhes(request, codigo):
	atividade = get_object_or_404(Atividade, pk=codigo)
	aem = AlunoEmTurma.objects.filter(
		aluno__id=request.user.id, 
		turma__codigo=atividade.turma.codigo
		).exists()
	if aem:
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
	else:
		return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def atividade_prioridade(request, codigo):
	try:
		atividade = get_object_or_404(Atividade, pk=codigo)
		if AlunoEmTurma.objects.filter(turma__codigo=atividade.turma.codigo, aluno=request.user.id).exists():
			check = Prioridade.objects.filter(aluno=request.user, atividade=atividade)
			if check:
				check.delete()
				return HttpResponseRedirect('/atividades/' + str(atividade.id) + '/')
			else:
				check = Prioridade(aluno=request.user, atividade=atividade)
				check.save()
				return HttpResponseRedirect('/atividades/' + str(atividade.id) + '/')
		else:
			return HttpResponseRedirect('/')
	except:
		return HttpResponseRedirect('/atividades/' + str(atividade.id) + '/')

@login_required(login_url='/admin/login/')
def atividade_cadastrar(request, codigo):
    if AlunoEmTurma.objects.filter(turma__codigo=codigo, aluno=request.user.id).exists():
        if request.method == 'POST':
            
            if len(request.POST.get('data_entrega_1')) == 5:
                #outra gambiarra
                request.POST = request.POST.copy()
                x = request.POST.get('data_entrega_1')
                request.POST['data_entrega_1'] += ":00"
            else:
                request.POST = request.POST.copy()
                x = request.POST.get('data_entrega_1')
                request.POST['data_entrega_1'] = x[:-3] + ":00"
            
            form = AtividadeForm(request.POST)
            turma = get_object_or_404(Turma, codigo=codigo)
            if form.is_valid():
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
                return HttpResponseRedirect('/' + nova_atividade.turma.codigo)
            else:
                return render(request, 'atividades/form.html', {'form' : form, 'turma': turma, 'erro': 'Preencha os dados corretamente.'})
        else:
            form = AtividadeForm()
            turma = get_object_or_404(Turma, codigo=codigo)
            context = {
                'form': form,
                'turma': turma,
                'edit': False,
            }
            return render(request, 'atividades/form.html', context)
    else:
        return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def atividade_editar(request, codigo):
    atividade = get_object_or_404(Atividade, id=codigo)
    if AlunoEmTurma.objects.filter(turma__codigo=atividade.turma.codigo, aluno=request.user.id).exists():
        if atividade.aluno == request.user:
            turma = get_object_or_404(Turma, codigo=atividade.turma.codigo)
            if request.method == 'POST':

                #Gambiarra pra truncar os segundos kkkkkk
                if len(request.POST.get('data_entrega_1')) == 5:
                    #outra gambiarra
                    request.POST = request.POST.copy()
                    x = request.POST.get('data_entrega_1')
                    request.POST['data_entrega_1'] += ":00"
                else:
                    request.POST = request.POST.copy()
                    x = request.POST.get('data_entrega_1')
                    request.POST['data_entrega_1'] = x[:-3] + ":00"
                
                form = AtividadeForm(request.POST, instance=atividade)
                if form.is_valid():
                        atividade = form.save(commit=False)
                        atividade.save()
                        return HttpResponseRedirect('/atividades/' + str(atividade.id))
                else:
                    return render(request, 'atividades/form.html', {'form' : form, 'turma': turma, 'atividade': atividade, 'edit': True, 'erro': 'Preencha os dados corretamente.'})
            else:
                form = AtividadeForm(instance=atividade)
                return render(request, 'atividades/form.html', {'form' : form, 'turma': turma, 'atividade': atividade, 'edit': True})
        else:
            return HttpResponseRedirect('/atividades/' + str(atividade.id))
    else:
        return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def atividade_excluir(request, codigo):
	atividade = get_object_or_404(Atividade, id=codigo)
	if AlunoEmTurma.objects.filter(turma__codigo=atividade.turma.codigo, aluno=request.user.id).exists():
		turma = atividade.turma
		if atividade.aluno == request.user:
			if request.method == 'POST':
				atividade.delete()
				return HttpResponseRedirect('/' + turma.codigo)
			else:
				return HttpResponseRedirect('/atividades/' + str(atividade.id))
		else:
			return HttpResponseRedirect('/atividades/' + str(atividade.id))
	else:
		return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def comentario_adicionar(request, atividade):
	oAtividade = get_object_or_404(Atividade, pk=atividade)
	if AlunoEmTurma.objects.filter(turma__codigo=oAtividade.turma.codigo, aluno=request.user.id).exists():
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
	else:
		return HttpResponseRedirect('/')

@login_required(login_url='/admin/login/')
def comentario_excluir(request, codigo):
	comentario = get_object_or_404(Comentario, id=codigo)
	if AlunoEmTurma.objects.filter(turma__codigo=comentario.atividade.turma.codigo, aluno=request.user.id).exists():
		if comentario.aluno == request.user:
			if request.method == 'POST':
				comentario.comentario = 'Comentário excluído por <strong>' + comentario.aluno.first_name + '</strong>'
				comentario.status = False
				comentario.save()
				return HttpResponseRedirect('/atividades/' + str(comentario.atividade.id))
			else:
				return HttpResponseRedirect('/atividades/' + str(comentario.atividade.id))
		elif comentario.atividade.turma.aluno == request.user:
			if request.method == 'POST':
				comentario.comentario = 'Comentário excluído por <strong>' + comentario.atividade.turma.aluno.first_name + '</strong>'
				comentario.status = False
				comentario.save()
				return HttpResponseRedirect('/atividades/' + str(comentario.atividade.id))
			else:
				return HttpResponseRedirect('/atividades/' + str(comentario.atividade.id))
		else:
			return HttpResponseRedirect('/atividades/' + str(comentario.atividade.id))	
	else:
		return HttpResponseRedirect('/')
