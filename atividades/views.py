from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required
from django.db.models import Count

from django.utils import timezone

from .models import *

# Create your views here.

def index(request):
	atividades = Atividade.objects.order_by('data_comentario')
	context = {
		'atividades': atividades,
	}
	return render(request, 'atividades/index.html', context)

def atividade(request, codigo):
	atividade = get_object_or_404(Atividade, pk=codigo)
	comentarios = Comentario.objects.filter(atividade=atividade).order_by('data_comentario')
	context = {
		'atividade' : atividade,
		'comentarios': comentarios
	}
	return render(request, 'atividades/detalhe.html', context)