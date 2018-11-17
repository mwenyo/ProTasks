"""ProTasks URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
import turmas, atividades
from contas.views import *

urlpatterns = [
    path('admin/', admin.site.urls),
    #path('turmas/', include('turmas.urls')),
    path('', include('turmas.urls')),
    path('atividades/', include('atividades.urls')),

    path('contas/login/', login_view, name="login"),
    path('contas/registrar/', register_view, name="registrar"),
    path('contas/sair/', logout_view, name="sair"),
    path('contas/<int:codigo>/alterar', change_view, name="alterar_cadastro"),
    path('contas/<int:codigo>/alterar_senha', change_password_view, name="alterar_senha"),
]
