# _*_ coding:utf-8 _*_
from django.test import TestCase
from django.test.client import Client



class TestTemplates_Login(TestCase):		
	def test_url_home_aluno(self):
		""" Teste de login """
		try:
			c= Client()
			c.post('/registration/login/', {'name': 'eduProf', 'passwd': '123'})
		except ImportError:
			self.fail("template 'login.html' not found!")




class TestTemplates_Aluno(TestCase):		
	def test_url_home_aluno(self):
		""" Teste de caminho para template """
		try:
			c= Client()
			response = c.get('/templates/home-aluno/')
			response.content
		except ImportError:
			self.fail("template 'home-aluno.html' not found!")


class TestTemplates_Professor(TestCase):		
	def test_url_home_prof(self):
		""" Teste de caminho para template """
		try:
			c= Client()
			response = c.get('/templates/home-prof/')
			response.content
		except ImportError:
			self.fail("template 'home-prof.html' not found!")
