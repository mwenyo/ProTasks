from django.urls import path

from .views import *

urlpatterns = [
	path('login/', login_view, name="login"),
    path('registrar/', register_view, name="registrar"),
    path('sair/', logout_view, name="sair"),
    path('<int:codigo>/alterar', change_view, name="alterar_cadastro"),
    path('<int:codigo>/alterar_senha', change_password_view, name="alterar_senha"),
]