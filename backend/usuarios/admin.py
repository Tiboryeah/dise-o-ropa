from django.contrib import admin
from .models import Cuenta, Disenador, TipoPrenda, Prenda, Diseno

# Admin de Cuenta
@admin.register(Cuenta)
class CuentaAdmin(admin.ModelAdmin):
    list_display = ('usuario', 'activa', 'admin')
    search_fields = ('usuario',)
    list_filter = ('activa', 'admin')

# Admin de Disenador
@admin.register(Disenador)
class DisenadorAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'email', 'usuario') 
    search_fields = ('nombre', 'email', 'usuario__usuario')  
    list_filter = ('usuario__usuario',)  

# Admin de TipoPrenda
@admin.register(TipoPrenda)
class TipoPrendaAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
    search_fields = ('nombre',)

# Admin de Prenda
@admin.register(Prenda)
class PrendaAdmin(admin.ModelAdmin):
    list_display = ('tipo_prenda', 'status')
    search_fields = ('tipo_prenda__nombre', 'status')
    list_filter = ('status',)

# Admin de Diseno
@admin.register(Diseno)
class DisenoAdmin(admin.ModelAdmin):
    list_display = ('diseno_name', 'diseno_date', 'color', 'talla', 'precio')
    search_fields = ('diseno_name', 'color', 'talla')
    list_filter = ('diseno_date', 'talla', 'precio')
    ordering = ('diseno_name',)
