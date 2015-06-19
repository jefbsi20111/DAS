# _*_ coding:utf-8 _*_
from django.test import TestCase


class TestClassTelefone(TestCase):
	def test_existe(self):
		""" Classe Telefone Existe? """
		try:
			from DAS_core.models import Telefone
		except ImportError:
			self.fail('Telefone Não Existe!')

	def test_create(self):
		from DAS_core.models import Telefone
		t = Telefone(numero="1234-5678",tipo="CE")
		t.save()

class TestClassEndereco(TestCase):
	def test_existe(self):
		""" Classe Endereco Existe? """
		try:
			from DAS_core.models import Endereco
		except ImportError:
			self.fail('Endereco Não Existe!')
	def test_create(self):
		from DAS_core.models import Endereco
		t = Endereco(rua="Mareita",cep="0909090",bairro="LogoAli",cidade="Parelhas",estado="RN")
		t.save()

class TestClassHorario(TestCase):
	def test_existe(self):
		""" Classe Horario Existe? """
		try:
			from DAS_core.models import Horario
		except ImportError:
			self.fail('Horario Não Existe!')
	def test_create(self):
		from DAS_core.models import Horario
		t = Horario(dia="Seg",horario="M12")
		t.save()				

class TestClassPeriodo(TestCase):
	def test_existe(self):
		""" Classe Periodo Existe? """
		try:
			from DAS_core.models import Periodo
		except ImportError:
			self.fail('Periodo Não Existe!')
	def test_create(self):
		from DAS_core.models import Periodo
		t = Periodo(periodo="2015.1")
		t.save()

class TestClassCod_nome(TestCase):
	def test_existe(self):
		""" Classe Cod_nome Existe? """
		try:
			from DAS_core.models import Cod_nome
		except ImportError:
			self.fail('Cod_nome Não Existe!')


class TestClassPessoa(TestCase):
	def test_existe(self):
		""" Classe Pessoa Existe? """
		try:
			from DAS_core.models import Pessoa
		except ImportError:
			self.fail('Pessoa Não Existe!')


class TestClassDisciplina(TestCase):
	def test_existe(self):
		""" Classe Disciplina Existe? """
		try:
			from DAS_core.models import Disciplina
		except ImportError:
			self.fail('Disciplina Não Existe!')
	def test_create(self):
		from DAS_core.models import Disciplina
		t = Disciplina(nome="Lógica",cod="BSI0909")
		t.save()

class TestClassCurso(TestCase):
	def test_existe(self):
		""" Classe Curso Existe? """
		try:
			from DAS_core.models import Curso
		except ImportError:
			self.fail('Curso Não Existe!')
	def test_create(self):
		from DAS_core.models import Curso
		from DAS_core.models import Disciplina
		t = Curso(nome="BSI",cod="BSI00")
		t.save()

class TestClassAluno(TestCase):
	def test_existe(self):
		""" Classe Aluno Existe?

		 """
		try:
			from DAS_core.models import Aluno
		except ImportError:
			self.fail('Aluno Não Existe!')

class TestClassProfessor(TestCase):
	def test_existe(self):
		""" Classe Professor Existe? """
		try:
			from DAS_core.models import Professor
		except ImportError:
			self.fail('Professor Não Existe!')


class TestClassUnidade(TestCase):
	def test_existe(self):
		""" Classe Unidade Existe? """
		try:
			from DAS_core.models import Unidade
		except ImportError:
			self.fail('Unidade Não Existe!')

class TestClassNoticia(TestCase):
	def test_existe(self):
		""" Classe Noticia Existe? """
		try:
			from DAS_core.models import Noticia
		except ImportError:
			self.fail('Noticia Não Existe!')

class TestClassArquivo(TestCase):
	def test_existe(self):
		""" Classe Arquivo Existe? """
		try:
			from DAS_core.models import Arquivo
		except ImportError:
			self.fail('Arquivo Não Existe!')

class TestClassTurma(TestCase):
	def test_existe(self):
		""" Classe Turma Existe? """
		try:
			from DAS_core.models import Turma
		except ImportError:
			self.fail('Turma Não Existe!')

class TestClassNota(TestCase):
	def test_existe(self):
		""" Classe Nota Existe? """
		try:
			from DAS_core.models import Nota
		except ImportError:
			self.fail('Nota Não Existe!')
