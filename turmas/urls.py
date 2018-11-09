from django.urls import path

from . import views

app_name = 'turmas'

urlpatterns = [
	path('', views.index, name='index'),
	path('cadastrar/', views.turma_add, name='cadastrar'),
	path('join/', views.join, name="join"),
	path('<codigo>/', views.turma, name="turma"), 
]