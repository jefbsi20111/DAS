#!/usr/bin/python
# -*- coding: utf-8 -*-
from django.db import models
from django.core.validators import *
from time import gmtime, strftime

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
    rua = models.CharField(max_length=200, verbose_name="Rua e número")
    complemento = models.CharField(max_length=200, blank=True, null=True)
    cep = models.CharField(max_length=200)
    bairro = models.CharField(max_length=200, blank=True, null=True)
    cidade = models.CharField(max_length=200)
    estado = models.CharField(max_length=200)

    def __unicode__(self):
        return u'%s %s' % (self.cidade, self.rua)

class Horario (models.Model):
    DIAS = (
        ('Seg', 'Segunda'),
        ('Ter', 'Terça'),
        ('Qua', 'Quarta'),
        ('Qui', 'Quinta'),
        ('Sex', 'Sexta')
        )

    HORARIOS = (
        ('M12', '07:00-08:30'),
        ('M23', '09:00-10:40')
        ,('M45', '10:40-12:20')
        )

    dia = models.CharField(max_length=3, choices=DIAS)
    horario = models.CharField(max_length=5, choices=HORARIOS)

    def __unicode__(self):
        return u'%s, %s'  % (self.dia, self.horario)

class Periodo(models.Model):
    PERIODOS = (
        ('2015.1', '2015.1'),
        ('2015.2', '2015.2'),
        ('2016.1', '2016.1'),
        ('2016.2', '2016.2'),
        ('2017.1', '2017.1')
        )

    periodo = models.CharField(max_length=10, choices=PERIODOS)

    def __unicode__(self):
        return u'%s'  % (self.periodo)

class Cod_nome (models.Model):
    nome = models.CharField(max_length=200)
    cod = models.CharField(max_length=20)

    class Meta():
        abstract = True
        ordering = ['nome']

    def __unicode__(self):
        return  u'%s %s' % (self.nome, self.cod)

class Pessoa (models.Model):
    nome = models.CharField(max_length=200)
    email = models.CharField(max_length=200, validators=[validate_email])
    endereco = models.OneToOneField(Endereco, verbose_name="Endereco")
    telefone = models.ForeignKey(Telefone, verbose_name="Telefone para contato")

    class Meta:
        abstract = True

    def __unicode__(self):
        return u'%s %s' % (self.nome, self.matricula)

    def matricula_default():
        matricula = strftime("%Y%s", gmtime())
        return matricula

    matricula = models.CharField(max_length=30, default=matricula_default)


class Disciplina (Cod_nome):
    pass

class Curso (Cod_nome):
    disciplina = models.ManyToManyField(Disciplina, verbose_name="Disciplinas da grade de um curso", null=True)
    #poll = models.ForeignKey(Poll, verbose_name="the related poll")

class Aluno (Pessoa):
    curso = models.ForeignKey(Curso, verbose_name="Curso do aluno")
    data_ingresso = models.DateField('Data de ingresso')
    disciplinas = models.ManyToManyField(Disciplina, verbose_name="Disciplina do aluno")


class Professor (Pessoa):
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

    def __unicode__(self):
        return self.label

class Noticia(models.Model):
    titulo = models.CharField(max_length=200)
    corpo = models.CharField(max_length=900)
    data_noticia = models.DateField(auto_now=True)

    def unicode(self):
        return self.titulo

class Arquivo(models.Model):
    titulo_arquivo = models.CharField(max_length=200, verbose_name="Titulo do arquivo")
    descricao_arquivo = models.CharField(max_length=200, null=True, verbose_name="Descricao do arquivo")
    arquivo = models.FileField(upload_to="files",verbose_name="Arquivo para upload")

    def __unicode__(self):
        return self.titulo

class Turma (models.Model):
    disciplina = models.OneToOneField(Disciplina, verbose_name="Disciplina")
    professor = models.ManyToManyField(Professor, verbose_name="Professor da Turma")
    alunos = models.ForeignKey(Aluno, verbose_name = "Alunos na disciplina")
    nome = models.CharField(max_length=200, verbose_name="Nome da turma", blank=True)
    periodo = models.ForeignKey(Periodo, verbose_name='Periodo')
    data_inicio = models.DateField('Data de início')
    data_termino = models.DateField('Data de término')
    arquivo = models.ManyToManyField(Arquivo, verbose_name="Arquivos", blank=True)
    noticia = models.ManyToManyField(Noticia, verbose_name="Notícia", blank=True)
    qtd_aulas = models.IntegerField(verbose_name="Quantidade de aulas")
    qtd_alunos = models.IntegerField(verbose_name="Quantidade de alunos")
    horario = models.ManyToManyField(Horario, verbose_name="Horario da discilpina")

    def __unicode__(self):
        return self.nome

class Nota(models.Model):
    valor = models.IntegerField(verbose_name="Nota")
    peso = models.IntegerField(verbose_name="Peso da Nota")
    aluno = models.ForeignKey(Aluno, verbose_name="Aluno")
    turma = models.ForeignKey(Turma, verbose_name="Disciplina")
    unidade = models.ForeignKey(Unidade, verbose_name="Unidade Disc.")

    def __unicode__(self):
        return u'%s, peso %s' % (self.valor, self.peso)

class Frequencia(models.Model):
    """docstring for Frequencia"""
    aluno = models.ForeignKey(Aluno, verbose_name="Aluno")
    turma = models.ForeignKey(Turma, verbose_name="Disciplina")
    n_faltas = models.IntegerField(verbose_name="Numero de faltas")

    def falta_1aula(self):
        self.n_faltas = n_faltas + 1

    def falta_2aula(self):
        self.n_faltas = n_faltas + 2

    def __unicode__(self):
        return u'%s' %(self.n_faltas)
