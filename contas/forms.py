from django import forms
from django.contrib.auth import (
    authenticate,
    get_user_model

)

User = get_user_model()


class UserLoginForm(forms.Form):
	username = forms.CharField()
	password = forms.CharField(widget=forms.PasswordInput)

	def clean(self, *args, **kwargs):
		username = self.cleaned_data.get('username')
		password = self.cleaned_data.get('password')

		if username and password:
			user = authenticate(username=username, password=password)
			if not user:
				print('Forms.py: Usuario não existe')
				raise forms.ValidationError('Usuário ou senha inválidos.')
			if not user.is_active:
				print('Forms.py: Este usuário não está ativo')
				raise forms.ValidationError('Este usuário não está ativo.')
			return super(UserLoginForm, self).clean(*args, **kwargs)


class UserRegisterForm(forms.ModelForm):
	username = forms.CharField()
	first_name = forms.CharField()
	email = forms.EmailField(label='Email address')
	password = forms.CharField(widget=forms.PasswordInput)
	confirm_password = forms.CharField(widget=forms.PasswordInput)

	class Meta:
		model = User
		fields = {
			'username',
			'first_name',
			'email',
			'password',
			'confirm_password',
		}

	def clean(self, *args, **kwargs):
		email = self.cleaned_data.get('email')
		username = self.cleaned_data.get('username')
		password = self.cleaned_data.get('password')
		
		confirm_password = self.cleaned_data.get('confirm_password')
		if password != confirm_password:
			raise forms.ValidationError("Senhas não conferem")
		
		email_qs = User.objects.filter(email=email)
		if email_qs.exists():
			raise forms.ValidationError(
				"Este email já está registrado para outro usuário.")
		
		if User.objects.filter(username=username).exists():
			raise forms.ValidationError(
				"Este nome de usuário já está registrado.")
		
		return super(UserRegisterForm, self).clean(*args, **kwargs)

class UserChangeForm(forms.ModelForm):
	email = forms.EmailField(label='Email address')

	class Meta:
		model = User
		fields = [
			'username',
			'email',
			'first_name',
		]

class UserChangePassWordForm(forms.ModelForm):
	old_password = forms.CharField(
		widget = forms.PasswordInput(
			attrs = {"placeholder" : "Senha antiga"}
			)
		)
	password = forms.CharField(
		widget=forms.PasswordInput(
			attrs={"placeholder" : "Nova senha"}
			)
		)
	confirm_password = forms.CharField(
		widget=forms.PasswordInput(
			attrs={"placeholder" : "Confirme a nova senha"}
			)
		)

	class Meta:
		model = User
		fields = [
			'old_password',
			'password',
			'confirm_password',
		]

	def clean(self, *args, **kwargs):
		password = self.cleaned_data.get('password')
		confirm_password = self.cleaned_data.get('password')
		
		confirm_password = self.cleaned_data.get('confirm_password')
		if password != confirm_password:
			raise forms.ValidationError("Senhas não conferem")

		return super(UserChangePassWordForm, self).clean(*args, **kwargs)