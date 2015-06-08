from django.shortcuts import render
from django.http import HttpResponse
from django.template import Context, loader
from django.http import Http404

# Create your views here.


def error404(request):
	
    return render(request, 'templates/home.html',status=404)
    
