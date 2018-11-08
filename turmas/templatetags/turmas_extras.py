from django import template

register = template.Library()

@register.filter
def in_category(atividade, aluno):
    return atividade.filter(atividade=category)