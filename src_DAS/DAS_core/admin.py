from django.contrib import admin

from DAS_core.models import Horario
from DAS_core.models import Disciplina
from DAS_core.models import Curso
from DAS_core.models import Endereco
from DAS_core.models import Telefone
from DAS_core.models import Aluno
from DAS_core.models import Professor
from DAS_core.models import Noticia
from DAS_core.models import Arquivo
from DAS_core.models import Turma

admin.site.register(Horario)
admin.site.register(Disciplina)
admin.site.register(Curso)
admin.site.register(Endereco)
admin.site.register(Telefone)
admin.site.register(Aluno)
admin.site.register(Professor)
admin.site.register(Noticia)
admin.site.register(Arquivo)
admin.site.register(Turma)

