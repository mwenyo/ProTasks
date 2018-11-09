from django import forms

class ComentarioForm(forms.Form):
    comentario = forms.CharField(
    	label='Coment&aacute;rio', 
    	widget=forms.Textarea(attrs={'class': 'summernote'})
    	)