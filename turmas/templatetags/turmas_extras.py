from django import template
from atividades.models import Prioridade

register = template.Library()

@register.filter(is_safe=True)
def is_priority(var, args):
	if args is None:
		return False
	try:
		p = Prioridade.objects.get(aluno=args, atividade=var)
		return True
	except:
		return False