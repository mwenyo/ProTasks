from django import forms

class ComentarioForm(forms.Form):
    comentario = forms.TextField(
    	label='Coment&aacute;rio', 
    	widget=forms.Textarea(attrs={'class': 'summernote'})
    	)