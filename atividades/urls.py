from django.urls import path

from . import views

app_name = 'atividades'

urlpatterns = [
	path('', views.index, name='index'),
	path('<codigo>/cadastrar/', views.cadastrar, name='cadastrar'),
	path('<int:codigo>/prioridade/', views.prioridade, name="prioridade"),
	path('<int:atividade>/comentar/', views.comentar, name="comentar"),
	path('<int:codigo>/', views.atividade, name="atividade"),
]