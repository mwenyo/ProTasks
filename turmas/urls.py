from django.urls import path

from . import views

app_name = 'turmas'

urlpatterns = [
	path('', views.turma_index, name='index'),
	path('cadastrar/', views.turma_cadastrar, name='cadastrar'),
	path('solicitar/', views.turma_solicitar, name="solicitar"),
	path('<codigo>/', views.turma_detalhes, name="turma"), 
	path('<codigo>/excluir', views.turma_excluir, name="turma_excluir"),
	path('<codigo>/editar', views.turma_editar, name="turma_editar"),

	path('<int:aem>/remover', views.remover_aluno, name="remover_aluno"),

	path('<int:codigo>/remover/solicitacao', views.remover_solicitacao, name="remover_solicitacao"),
	path('<int:codigo>/aceitar/solicitacao', views.aceitar_solicitacao, name="aceitar_solicitacao"),
]