# Generated by Django 2.1.1 on 2018-11-05 17:45

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('turmas', '0004_auto_20181105_1439'),
    ]

    operations = [
        migrations.AddField(
            model_name='atividade',
            name='data_modificacao',
            field=models.DateTimeField(auto_now=True, verbose_name='Data de Modificação'),
        ),
        migrations.AlterField(
            model_name='atividade',
            name='data_cadastro',
            field=models.DateTimeField(auto_now_add=True, verbose_name='Data de Cadastro'),
        ),
    ]
