from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
# Create your models here.

class Atividade(models.Model):
	turma = models.ForeignKey('turmas.Turma', on_delete=models.CASCADE)
	aluno = models.ForeignKey(User, on_delete=models.CASCADE)
	disciplina = models.CharField("Nome da disciplina", max_length=200)
	atividade = models.CharField("Nome da atividade", max_length=200)
	data_cadastro = models.DateTimeField("Data de Cadastro", auto_now_add=True)
	data_modificacao = models.DateTimeField("Data de Modificação", auto_now=True)
	data_entrega = models.DateTimeField("Data de Entrega")
	valor = models.DecimalField(max_digits=4, decimal_places=2)
	observacoes = models.TextField("Observações")

	@property
	def num_comentarios(self):
		return Comentario.objects.filter(atividade = self).count()

	
	@property
	def expirou(self):
		entrega = self.data_entrega
		now = timezone.now()
		return entrega >= now

class Comentario(models.Model):
	atividade = models.ForeignKey(Atividade, on_delete=models.CASCADE)
	aluno = models.ForeignKey(User, on_delete=models.CASCADE)
	comentario = models.TextField("Comentário")
	data_comentario = models.DateTimeField("Data de Publicação", auto_now_add=True)
	data_modificacao = models.DateTimeField("Data de Modificação", auto_now=True)

	class Meta:
		verbose_name = "Comentário"
		verbose_name_plural = "Comentários"

class Prioridade(models.Model):
	aluno = models.ForeignKey(User, verbose_name="Aluno", on_delete=models.CASCADE)
	atividade = models.ForeignKey(Atividade, on_delete=models.CASCADE)

	class Meta:
		unique_together = (("aluno", "atividade"),)

class Notificacao(models.Model):
	prioridade = models.ForeignKey(Prioridade, on_delete=models.CASCADE)
	texto = models.CharField(max_length=200)
	visualizada = models.BooleanField(default=False)

	class Meta:
		verbose_name = "Notificação"
		verbose_name_plural = "Notificações"