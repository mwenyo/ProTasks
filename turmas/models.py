from django.db import models
from django.contrib.auth.models import User
from atividades.models import Atividade

from random import choice
# Create your models here.

class Turma(models.Model):
	aluno = models.ForeignKey(User, verbose_name="Administrador", on_delete=models.CASCADE)
	nome = models.CharField(max_length=200)
	codigo = models.CharField("Código", max_length=200, blank=True, null=True, unique=True)
	curso = models.CharField(max_length=200)
	ano = models.PositiveIntegerField("Ano/Módulo")
	turno = models.CharField(max_length=200)
	data_cadastro = models.DateTimeField("Data de Cadastro", auto_now_add=True)

	def __str__(self):
		return self.nome + " - " + self.codigo	

	@property
	def num_atividades(self):
		return Atividade.objects.filter(turma = self).count()

	def save(self, *args, **kwargs):
		if not self.codigo:
			caracteres = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
			senha = ""
			for i in range(5):
				senha += choice(caracteres)
			self.codigo = senha
			super(Turma, self).save(*args, **kwargs)
		else:
			super(Turma, self).save(*args, **kwargs)

class AlunoEmTurma(models.Model):
	aluno = models.ForeignKey(User, verbose_name="Aluno", on_delete=models.CASCADE)
	turma = models.ForeignKey(Turma, on_delete=models.CASCADE)
	data_cadastro = models.DateTimeField("Data de Cadastro", auto_now_add=True)

	class Meta:
		verbose_name_plural = "Alunos em Turmas"
		unique_together = (("aluno", "turma"),)

class Solicitacao(models.Model):
	aluno = models.ForeignKey(User, verbose_name="Aluno", on_delete=models.CASCADE)
	turma = models.ForeignKey(Turma, on_delete=models.CASCADE)
	data_cadastro = models.DateTimeField("Data de Solicitação", auto_now_add=True)

	class Meta:
		verbose_name_plural = "Solicitação"
		verbose_name_plural = "Solicitações"
		unique_together = (("aluno", "turma"),)