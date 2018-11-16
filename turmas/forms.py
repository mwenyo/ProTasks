from django import forms
from .models import *

class JoinTurma(forms.Form):
    codigo = forms.CharField(
    	label='C&oacute;digo', 
    	max_length=200,
    	widget=forms.TextInput(attrs={'class': 'input'})
    	)

class TurmaForm(forms.ModelForm):
    ano = forms.IntegerField(
        label='Ano/M&oacute;dulo', 
        min_value=1,
        widget=forms.NumberInput(attrs={'placeholder':'Ano/Módulo'})
        )
    class Meta:
        model = Turma
        fields = ('nome', 'curso', 'ano', 'turno')
        widgets = {
            'nome': forms.TextInput(attrs={'placeholder':'Nome da turma'}),
            'curso': forms.TextInput(attrs={'placeholder':'Nome do Curso'}),
            'turno': forms.TextInput(attrs={'placeholder':'Turno'}),
        }
    """
	nome = forms.CharField(
    	label='Nome', 
    	max_length=200,
    	widget=forms.TextInput(attrs={'placeholder':'Nome da turma'})
    	)
	curso = forms.CharField(
    	label='Curso', 
    	max_length=200,
    	widget=forms.TextInput(attrs={'placeholder':'Nome do Curso'})
    	)
	ano = forms.IntegerField(
    	label='Ano/M&oacute;dulo', 
    	min_value=1,
    	widget=forms.NumberInput(attrs={'placeholder':'Ano/Módulo'})
    	)
	turno = forms.CharField(
    	label='Turno', 
    	max_length=200,
    	widget=forms.TextInput(attrs={'placeholder':'Turno'})
    	)
    """
