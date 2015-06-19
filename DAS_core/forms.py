from django import forms
from .models import Frequencia, Disciplina, Turma, Nota, Arquivo, Noticia


class FreqForm(forms.ModelForm):
    def __init__(self,disc,*args,**kwargs):
        super (FreqForm,self ).__init__(*args,**kwargs) # populates the post
        turma = Turma.objects.filter(disciplina=disc).get()
        turmaid = turma.pk
        self.fields['turma'].queryset = Turma.objects.filter(pk=turmaid)

    class Meta():
        model = Frequencia

class InserirNota(forms.ModelForm):
    def __init__(self,disc,*args,**kwargs):
        super (InserirNota,self ).__init__(*args,**kwargs) # populates the post
        turma = Turma.objects.filter(disciplina=disc).get()
        turmaid = turma.pk
        self.fields['turma'].queryset = Turma.objects.filter(pk=turmaid)

    class Meta():
        model = Nota

class InserirArquivo(forms.ModelForm):
    def __init__(self,disc,*args,**kwargs):
        super (InserirArquivo,self ).__init__(*args,**kwargs) # populates the post
        turma = Turma.objects.filter(disciplina=disc).get()
        turmaid = turma.pk
        self.fields['turma'].queryset = Turma.objects.filter(pk=turmaid)

    class Meta():
        model = Arquivo

class InserirNoticia(forms.ModelForm):
    def __init__(self,disc,*args,**kwargs):
        super (InserirNoticia,self ).__init__(*args,**kwargs) # populates the post
        turma = Turma.objects.filter(disciplina=disc).get()
        turmaid = turma.pk
        self.fields['turma'].queryset = Turma.objects.filter(pk=turmaid)

    class Meta():
        model = Noticia
