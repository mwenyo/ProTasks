from django.contrib import admin

from .models import *

# Register your models here.

admin.site.register(Atividade)
admin.site.register(Comentario)
admin.site.register(Prioridade)
admin.site.register(Notificacao)