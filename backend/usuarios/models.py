from django.db import models

# Modelo Cuenta
class Cuenta(models.Model):
    usuario = models.CharField(max_length=100, unique=True)
    contrasena = models.CharField(max_length=255)
    activa = models.BooleanField(default=True)
    admin = models.BooleanField(default=False)

    def __str__(self):
        return self.usuario

# Modelo Disenador
class Disenador(models.Model):
    nombre = models.CharField(max_length=255)
    email = models.EmailField(unique=True)
    usuario = models.ForeignKey(Cuenta, on_delete=models.CASCADE, related_name='disenadores')

    def __str__(self):
        return self.nombre

# Modelo TipoPrenda
class TipoPrenda(models.Model):
    nombre = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.nombre

# Modelo Prenda
class Prenda(models.Model):
    tipo_prenda = models.ForeignKey(TipoPrenda, on_delete=models.CASCADE)
    status = models.CharField(max_length=50)

    def __str__(self):
        return f"{self.tipo_prenda} - {self.status}"

# Modelo Diseno
class Diseno(models.Model):
    diseno_name = models.CharField(max_length=255)
    diseno_date = models.DateField()
    color = models.CharField(max_length=50)
    talla = models.CharField(max_length=50)
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    prenda = models.ForeignKey(Prenda, null=True, on_delete=models.SET_NULL)
    disenador = models.ForeignKey(Disenador, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.diseno_name
