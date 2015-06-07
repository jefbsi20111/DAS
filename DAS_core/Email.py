from django.core.mail.message import EmailMessage
from django.core.mail import send_mail


#outra tentativa
class das_email:
	def enviar_email(self,assunto,corpo,de,para):
		send_mail(assunto, corpo,de,[para])
