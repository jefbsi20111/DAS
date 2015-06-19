from django.conf.urls import patterns, include, url
from DAS_core.views import *
from django.contrib import admin
from django.views.generic import TemplateView

admin.autodiscover()

urlpatterns = patterns('',
    url('^', include('django.contrib.auth.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^home/$', Home.as_view(), name='home'),
    url(r'^home-prof/$', home_prof, name='home-prof'),
    url(r'^home-aluno/$', home_aluno, name='home-aluno'),
    url(r'^home-prof/disc-inserir-freq/(?P<pk>\d+)/$', FreqForm.as_view(), name='inserir-freq-disc'),
    url(r'^home-prof/disc-inserir-nota/(?P<pk>\d+)/$', NotaForm.as_view(), name='inserir-nota-disc'),
    url(r'^home-prof/disc-inserir-noticia/(?P<pk>\d+)/$', NoticiaForm.as_view(), name='inserir-noticia-disc'),
    url(r'^disc-inserir-arquivo/(?P<pk>\d+)/$', ArquivoForm.as_view(), name='inserir-arquivo-disc'),
    url(r'^disc-detail-freq/(?P<pk>\d+)/$', disc_detail, name='detalhe-freq-disc'),
    #url(r'^disc-inserir-nota/$', inserir_nota, name='inserir-nota-disc'),
)
