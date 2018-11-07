from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.db.models import Count
from .models import *
# Create your views here.

@login_required()
def index(request):
	ultimas_turmas = Turma.objects.order_by('-data_cadastro')
	context = {
		'ultimas_turmas': ultimas_turmas,
	}
	return render(request, 'turmas/index.html', context)

def turma(request, codigo):
    turma = get_object_or_404(Turma, codigo=codigo)
    context = {
    	'turma' : turma,
    }
    return render(request, 'turmas/detalhe.html', context)