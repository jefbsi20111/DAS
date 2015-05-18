#!/usr/bin/python
# -*- coding: utf-8 -*-
from django.db import models
from django.core.validators import *

class Telefone (models.Model):
    TIPOS = (
        ('CE', 'Celular'),
        ('TE', 'Telefone'),
    )

    numero = models.CharField(max_length=200)
    tipo = models.CharField(max_length=3, choices=TIPOS)

    def __unicode__(self):
        return self.numero

class Endereco (models.Model):
    tipo = models.CharField(max_length=200, blank=True, null=True)
    rua = models.CharField(max_length=200, verbose_name="Rua e número")
    complemento = models.CharField(max_length=200, blank=True, null=True)
    cep = models.CharField(max_length=200)
    bairro = models.CharField(max_length=200)
    cidade = models.CharField(max_length=200)
    estado = models.CharField(max_length=200)
    pais = models.CharField(max_length=200)

    def __unicode__(self):
        return self.rua

class Horario (models.Model):
    DIAS = (
        ('Seg', 'Segunda'),
        ('Ter', 'Terça'),
        ('Qua', 'Quarta'),
        ('Qui', 'Quinta'),
        ('Sex', 'Sexta')
        )

    dias = models.CharField(max_length=3, choices=DIAS)
    hora = models.TimeField()

class Nota(models.Model):
    valor = models.IntegerField(verbose_name="Nota")
    peso = models.IntegerField(verbose_name="Peso da Nota")

class Periodo(models.Model):
    PERIODOS = (
        ('2015.1', '2015.1'),
        ('2015.2', '2015.2'),
        ('2016.1', '2016.1'),
        ('2016.2', '2016.2'),
        ('2017.1', '2017.1')
        )
    periodos = models.CharField(max_length=6, choices=PERIODOS)
    

class Cod_nome (models.Model):
    nome = models.CharField(max_length=200)
    cod = models.CharField(max_length=20)

    class Meta():
        abstract = True
        ordering = ['nome']

    def __unicode__(self):
        return self.nome

class Pessoa (models.Model):
    nome = models.CharField(max_length=200)
    matricula = models.CharField(max_length=200)
    email = models.CharField(max_length=200, validators=[validate_email])
    endereco = models.OneToOneField(Endereco, verbose_name="Endereco")
    telefone = models.ForeignKey(Telefone, verbose_name="Telefone para contato")

    class Meta:
        abstract = True

    def __unicode__(self):
        return self.nome

class Disciplina (Cod_nome):
    qtd_alunos = models.IntegerField('Quantidade de alunos')
    horario = models.ManyToManyField(Horario, verbose_name="Horario da discilpina")

class Curso (Cod_nome):
    disciplina = models.ManyToManyField(Disciplina, verbose_name="Disciplinas da grade de um curso", null=True)
    #poll = models.ForeignKey(Poll, verbose_name="the related poll")
    
class Aluno (Pessoa):
    curso = models.ForeignKey(Curso, verbose_name="Curso do aluno")
    periodo = models.CharField(max_length=200)
    data_ingresso = models.DateTimeField('Data de ingresso')
    disciplinas = models.ManyToManyField(Disciplina, verbose_name="Disciplina do aluno")


class Professor (Pessoa):
    disciplina = models.ManyToManyField(Disciplina, verbose_name=
        "Diciplinas alocadas para o professor")
    tipo_contrato = models.CharField(max_length=200)
    data_contratacao = models.DateTimeField('Data da contratacão')
    data_recisao = models.DateTimeField('Data da recisão', null=True)

class Unidade(models.Model):
    LABEL = (("1","1°"),
            ("2","2°"),
            ("3","3°"),
            ("4","4°"),
            ("5","5°"),
            ("6","6°"),
            )
    label = models.CharField(max_length=3,choices=LABEL)
    nota = models.ManyToManyField(Nota, verbose_name="Nota da Unidade")
    disciplina = models.OneToOneField(Disciplina, verbose_name="Unidade")

    def __unicode__(self):
        return self.label

class Noticia(models.Model):
    titulo = models.CharField(max_length=200)
    corpo = models.CharField(max_length=900)
    data_noticia = models.DateField(auto_now=True)

class Arquivo(models.Model):
    titulo_arquivo = models.CharField(max_length=200, verbose_name="Titulo do arquivo")
    descricao_arquivo = models.CharField(max_length=200, null=True, verbose_name="Descricao do arquivo")
    arquivo = models.FileField(upload_to="files",verbose_name="Arquivo para upload")
    
    def __unicode__(self):
        return self.titulo


class Turma (models.Model):
    disciplina = models.OneToOneField(Disciplina, verbose_name="Disciplina")
    data_inicio = models.DateField('Data de início')
    data_termino = models.DateField('Data de término')
    arquivo = models.ManyToManyField(Arquivo, verbose_name="Arquivos")
    noticia = models.ManyToManyField(Noticia, verbose_name="Notícia")