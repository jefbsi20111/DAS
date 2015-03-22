#!/usr/bin/python
# -*- coding: utf-8 -*-
from django.db import models
from django.core.validators import *

class Cod_nome (models.Model):
    nome = models.CharField(max_length=200)
    cod = models.CharField(max_length=20)

    class Meta():
        abstract = True
        ordering = ['nome']

    def __unicode__(self):
        return self.nome

class Disciplina (Cod_nome):
    None

class Curso (Cod_nome):
    disciplina = models.ManyToManyField(Disciplina, verbose_name="Disciplinas da grade de um curso", null=True)
    #poll = models.ForeignKey(Poll, verbose_name="the related poll")


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

class Aluno (Pessoa):
    curso = models.ForeignKey(Curso, verbose_name="Curso do aluno")
    periodo = models.CharField(max_length=200)
    data_ingresso = models.DateTimeField('Data de ingresso')

class Professor (Pessoa):
    disciplina = models.ManyToManyField(Disciplina, verbose_name=
        "Diciplinas alocadas para o professor")
    tipo_contrato = models.CharField(max_length=200)
    data_contratacao = models.DateTimeField('Data da contratacão')
    data_recisao = models.DateTimeField('Data da recisão', null=True)
