# _*_ coding:utf-8 _*_
from django.test import TestCase

#gera erro
class TestAlgo(TestCase):
	def test_existe(self):
		""" Estou procurando Classe Algo, ela existe? """
		try:
			from DAS_core.models import Algo
		except ImportError:
			self.fail('Classe Algo não existe!')

class TestClassTelefone(TestCase):
	def test_existe(self):
		""" Classe Telefone ok? """
		try:
			from DAS_core.models import Telefone
		except ImportError:
			self.fail('Telefone OK!')

class TestClassEndereco(TestCase):
	def test_existe(self):
		""" Classe Endereco ok? """
		try:
			from DAS_core.models import Endereco
		except ImportError:
			self.fail('Endereco ok!')

class TestClassHorario(TestCase):
	def test_existe(self):
		""" Classe Horario ok? """
		try:
			from DAS_core.models import Horario
		except ImportError:
			self.fail('Horario ok!')


class TestClassPeriodo(TestCase):
	def test_existe(self):
		""" Classe Periodo ok? """
		try:
			from DAS_core.models import Periodo
		except ImportError:
			self.fail('Periodo ok!')

class TestClassCod_nome(TestCase):
	def test_existe(self):
		""" Classe Cod_nome ok? """
		try:
			from DAS_core.models import Cod_nome
		except ImportError:
			self.fail('Cod_nome ok!')


class TestClassPessoa(TestCase):
	def test_existe(self):
		""" Classe Pessoa ok? """
		try:
			from DAS_core.models import Pessoa
		except ImportError:
			self.fail('Pessoa ok!')


class TestClassDisciplina(TestCase):
	def test_existe(self):
		""" Classe Disciplina ok? """
		try:
			from DAS_core.models import Disciplina
		except ImportError:
			self.fail('Disciplina ok!')


class TestClassCurso(TestCase):
	def test_existe(self):
		""" Classe Curso ok? """
		try:
			from DAS_core.models import Curso
		except ImportError:
			self.fail('Curso ok!')


class TestClassAluno(TestCase):
	def test_existe(self):
		""" Classe Aluno ok?

		 """
		try:
			from DAS_core.models import Aluno
		except ImportError:
			self.fail('Aluno ok!')

class TestClassProfessor(TestCase):
	def test_existe(self):
		""" Classe Professor ok? """
		try:
			from DAS_core.models import Professor
		except ImportError:
			self.fail('Professor ok!')


class TestClassUnidade(TestCase):
	def test_existe(self):
		""" Classe Unidade ok? """
		try:
			from DAS_core.models import Unidade
		except ImportError:
			self.fail('Unidade ok!')

class TestClassNoticia(TestCase):
	def test_existe(self):
		""" Classe Noticia ok? """
		try:
			from DAS_core.models import Noticia
		except ImportError:
			self.fail('Noticia ok!')

class TestClassArquivo(TestCase):
	def test_existe(self):
		""" Classe Arquivo ok? """
		try:
			from DAS_core.models import Arquivo
		except ImportError:
			self.fail('Arquivo ok!')

class TestClassTurma(TestCase):
	def test_existe(self):
		""" Classe Turma ok? """
		try:
			from DAS_core.models import Turma
		except ImportError:
			self.fail('Turma ok!')

class TestClassNota(TestCase):
	def test_existe(self):
		""" Classe Nota ok? """
		try:
			from DAS_core.models import Nota
		except ImportError:
			self.fail('Nota ok!')
