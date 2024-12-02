from django.db import models

class Cuenta(models.Model):
    usuario = models.CharField(max_length=100, unique=True)
    contrasena = models.CharField(max_length=255)
    activa = models.BooleanField(default=True)
    admin = models.BooleanField(default=False)

class Disenador(models.Model):
    nombre = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    cuenta = models.ForeignKey(Cuenta, on_delete=models.CASCADE)

class TipoPrenda(models.Model):
    nombre = models.CharField(max_length=50, unique=True)

class Prenda(models.Model):
    tipo = models.ForeignKey(TipoPrenda, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)

class Diseno(models.Model):
    nombre = models.CharField(max_length=255)
    fecha = models.DateField()
    color = models.CharField(max_length=50)
    talla = models.CharField(max_length=50)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    prenda = models.ForeignKey(Prenda, on_delete=models.CASCADE)
    disenador = models.ForeignKey(Disenador, on_delete=models.CASCADE)
    imagen_url = models.URLField(max_length=255)
