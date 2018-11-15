from django.urls import path

from . import views

app_name = 'atividades'

urlpatterns = [
	path('', views.atividade_index, name='index'),
	path('<codigo>/cadastrar/', views.cadastrar, name='cadastrar'),
	path('<int:codigo>/excluir/', views.atividade_excluir, name='excluir'),
	path('<int:codigo>/editar/', views.atividade_editar, name='editar'),
	path('<int:codigo>/prioridade/', views.atividade_prioridade, name="prioridade"),
	path('<int:atividade>/comentar/', views.comentario_adicionar, name="comentar"),
	path('<int:codigo>/', views.atividade_atividade, name="atividade"),
]