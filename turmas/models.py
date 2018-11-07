from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Turma(models.Model):
	aluno = models.ForeignKey(User, verbose_name="Administrador", on_delete=models.CASCADE)
	nome = models.CharField(max_length=200)
	codigo = models.CharField("Código", max_length=200, blank=True, null=True)
	curso = models.CharField(max_length=200)
	ano = models.PositiveIntegerField("Ano/Módulo")
	turno = models.CharField(max_length=200)
	data_cadastro = models.DateTimeField("Data de Cadastro", auto_now_add=True)

	def __str__(self):
		return self.nome + " - " + self.codigo
		
class AlunoEmTurma(models.Model):
	aluno = models.ForeignKey(User, verbose_name="Aluno", on_delete=models.CASCADE)
	turma = models.ForeignKey(Turma, on_delete=models.CASCADE)
	data_cadastro = models.DateTimeField("Data de Cadastro", auto_now_add=True)

	class Meta:
		verbose_name_plural = "Alunos em Turmas"
		unique_together = (("aluno", "turma"),)