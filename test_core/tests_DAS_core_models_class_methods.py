# _*_ coding:utf-8 _*_
from django.test import TestCase
from DAS_core.models import *

'''class test_algo(TestCase):
	def test_index(self):
		response = self.client.get('/DAS_core/templates/index/')
		self.assertEqual(response.status_code,200)'''

class TestClass_Disciplina(TestCase):
	def test_get_disc_detail_url(self):
		""" Método get_disc_detail_url() funciona? """
		try:
			disciplina = Disciplina()
			disciplina.id = 1
			disciplina.get_disc_detail_url()
		except ImportError:
			self.fail("Mehtod 'get_disc_detail_url()' doesn't work!")


class TestClass_Aluno(TestCase):
	def test_get_home_aluno_url(self):
		""" Método 'get_home_aluno_url()' funciona? """
		try:
			aluno = Aluno()
			aluno.id = 1
			aluno.get_home_aluno_url()
		except ImportError:
			self.fail("Mehtod 'get_home_aluno_url()' doesn't work!")