from django import forms

class JoinTurma(forms.Form):
    codigo = forms.CharField(
    	label='C&oacute;digo', 
    	max_length=200,
    	widget=forms.TextInput(attrs={'class': 'input-lg'})
    	)