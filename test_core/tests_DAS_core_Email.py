#_*_ coding:utf-8 _*_
from django.test import TestCase
from DAS_core.Email import das_email


class test_class_email_das(TestCase):
	
	def test_existe(self):
		""" Classe Email existe? """
		try:
			from DAS_core.Email import das_email
		except ImportError:
			self.fail("Class Email not found in 'DAS_core.Email' !")

	def test_call_enviar_mail(self):
		""" Método enviar_email() atende? """
		try:
			from DAS_core.Email import das_email
			email = das_email()
			assunto = "Assunto do email"
			corpo = "corpo do email"
			de = "jefbsi2011.1@gmail.com"
			para = "jefbsi2011.1@hotmail.com"
			email.enviar_email(assunto,corpo,de,para)
		except ImportError:
			self.fail("method 'enviar_email' doesn't work!")
