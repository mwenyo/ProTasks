from django import forms
from .models import *
#from datetimepicker.widgets import DateTimePicker

class ComentarioForm(forms.Form):
    comentario = forms.CharField(
    	widget=forms.Textarea(attrs={'class': 'summernote'})
    	)

class AtividadeForm(forms.ModelForm):
    valor = forms.DecimalField(
        min_value=0,
        max_digits=4,
        max_value=10.00,
        widget=forms.NumberInput(attrs={'placeholder':'Valor em Pontos'})
        )
    data_entrega = forms.SplitDateTimeField(
        input_date_formats = ['%d/%m/%Y'],
        input_time_formats = ['%H:%M:%S'],
        widget = forms.SplitDateTimeWidget(
            date_attrs = {'class': '', 'placeholder':'Data de Entrega'},
            time_attrs = {'class': 'clockpicker', 'placeholder':'Horário da Entrega'}),
        )
    class Meta:
        model = Atividade
        fields = ('disciplina','atividade','valor','data_entrega','observacoes')
        widgets={
            'disciplina': forms.TextInput(attrs={'placeholder':'Nome da Disciplina'}),
            'atividade': forms.TextInput(attrs={'placeholder':'Título da Avtividade'}),
            'observacoes': forms.Textarea(attrs={'class': 'summernote'})
        }