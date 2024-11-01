from django.contrib import admin
from .models import Cuenta, Disenador, Prenda, Diseno, ArchivoDiseno, HistorialDescargas, VersionDiseno

admin.site.register(Cuenta)
admin.site.register(Disenador)
admin.site.register(Prenda)
admin.site.register(Diseno)
admin.site.register(ArchivoDiseno)
admin.site.register(HistorialDescargas)
admin.site.register(VersionDiseno)
