from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response,redirect
from django.shortcuts import get_object_or_404, render
from django.core.exceptions import PermissionDenied
from DAS_core.views import *
from DAS_core.models import *
from DAS_core.forms import *
from django.contrib.auth import authenticate, login
from django.views.generic import TemplateView
from django.http import HttpResponseRedirect
from django.template import RequestContext
from django.contrib.auth.models import User
from django.core.urlresolvers import reverse
from django.shortcuts import render
from django.views.generic import *
from django.views import generic
from django.http import *
from django.core.urlresolvers import reverse_lazy
from django.core.urlresolvers import reverse
#from DAS_core import perm
#from brace.views import PermissionRequiredMixin


def home_prof(request):
    user = request.user
    email = user.email
    prof = Professor.objects.get(email=email)
    turmas = Turma.objects.all().filter(professor=prof)
    context = {'prof': prof, 'turmas': turmas}
    return render(request, 'home-prof.html', context)
#class HomeProf(TemplateView):

def home_aluno(request):
    turmas = []
    user = request.user
    email = user.email
    aluno = Aluno.objects.all().prefetch_related('disciplinas')
    aluno = aluno.get(email=email)
    turmas = Turma.objects.filter(alunos__id=aluno.pk)
 
    notas = Nota.objects.filter(turma=turmas)
    notas = notas.filter(aluno=aluno).order_by('unidade')
    #print notas
 
    frequencia = Frequencia.objects.filter(turma=turmas)
    #print frequencia
    frequencia = frequencia.filter(aluno=aluno)
 
    noticias = Noticia.objects.filter(turma=turmas)
    context = {'aluno': aluno, 'turmas': turmas, 'notas': notas, 'noticias': noticias, 'frequencia': frequencia}
    return render(request, 'home-aluno.html', context)

def disc_detail(request, pk):
    disciplina = Disciplina.object.get(pk=pk)
    return render(request, 'disc/disc-detail.html')

    #template_name = 'home-prof.html'
    #permission_required = 'global_permissions.pode_acessar_disc_prof'
    #def render_to_response(self, response):
        #email = self.request.user
        #render_to_response('home-prof.html')
    #email = user.email



    return render(request, 'disc/disc-detail.html')



class Home(TemplateView):

    template_name = 'home.html'

class FreqForm(CreateView):
    teamplate_name = 'disc/frequencia_form.html'
    model = Frequencia
    success_url = reverse_lazy('home-prof')

class NotaForm(CreateView):
    teamplate_name = 'DAS_core/cadastrar_nota.html'
    model = Nota
    success_url = reverse_lazy('home-prof')

class NoticiaForm(CreateView):
    teamplate_name = 'DAS_core/noticia_form.html'
    model = Noticia
    success_url = reverse_lazy('home-prof')

class ArquivoForm(CreateView):
    teamplate_name = 'DAS_core/arquivo_form.html'
    model = Arquivo
    success_url = reverse_lazy('home-prof')


