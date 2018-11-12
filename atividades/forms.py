from django import forms
#from datetimepicker.widgets import DateTimePicker

class ComentarioForm(forms.Form):
    comentario = forms.CharField(
    	widget=forms.Textarea(attrs={'class': 'summernote'})
    	)

class AtividadeForm(forms.Form):
	disciplina = forms.CharField(
    	max_length=200,
    	widget=forms.TextInput(attrs={'placeholder':'Nome da Disciplina'})
    	)
	atividade = forms.CharField(
    	max_length=200,
    	widget=forms.TextInput(attrs={'placeholder':'Título da Avtividade'})
    	)
	valor = forms.DecimalField(
    	min_value=0,
    	max_digits=2,
    	max_value=10.00,
    	widget=forms.NumberInput(attrs={'placeholder':'Valor em Pontos'})
    	)
	data_entrega = forms.SplitDateTimeField(
        input_date_formats = '%d/%m/%Y',
        input_time_formats = '%H:%M',
        widget = forms.SplitDateTimeWidget(
            date_attrs = {'class': 'datepicker', 'placeholder':'Data de Entrega'},
            time_attrs = {'class': 'clockpicker', 'placeholder':'Horário da Entrega'}),
        )
	observacoes = forms.CharField(
    	widget=forms.Textarea(attrs={'class': 'summernote'})
    	)