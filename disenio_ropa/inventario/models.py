from django.db import models

# Modelo para la tabla Cuenta
class Cuenta(models.Model):
    usuario_id = models.AutoField(primary_key=True)
    contrasena = models.CharField(max_length=255)
    activa = models.BooleanField()
    admin = models.BooleanField()

    class Meta:
        db_table = 'cuenta'
        managed = False

    def __str__(self):
        return f"Cuenta {self.usuario_id}"


# Modelo para la tabla Disenador
class Disenador(models.Model):
    disenador_id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    usuario_id = models.IntegerField()

    class Meta:
        db_table = 'disenador'
        managed = False

    def __str__(self):
        return f"Disenador {self.nombre}"


# Modelo para la tabla Prenda
class Prenda(models.Model):
    prenda_id = models.AutoField(primary_key=True)
    type = models.CharField(max_length=50)
    status = models.CharField(max_length=50)

    class Meta:
        db_table = 'prenda'
        managed = False

    def __str__(self):
        return f"Prenda {self.type}"


# Modelo para la tabla Diseno
class Diseno(models.Model):
    diseno_id = models.AutoField(primary_key=True)
    diseno_name = models.CharField(max_length=255)
    diseno_date = models.DateField()
    color = models.CharField(max_length=50)
    talla = models.CharField(max_length=50)
    prenda_id = models.IntegerField()
    disenador_id = models.IntegerField()

    class Meta:
        db_table = 'diseno'
        managed = False

    def __str__(self):
        return f"Diseno {self.diseno_name}"


# Modelo para la tabla Archivo_Diseno
class ArchivoDiseno(models.Model):
    archivo_id = models.AutoField(primary_key=True)
    diseno_id = models.IntegerField(null=True)
    usuario_id = models.IntegerField(null=True)
    nombre_archivo = models.CharField(max_length=255, null=True)
    ruta_archivo = models.CharField(max_length=255, null=True)
    fecha_guardado = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'archivo_diseno'
        managed = False

    def __str__(self):
        return f"Archivo {self.nombre_archivo}"


# Modelo para la tabla Historial_Descargas
class HistorialDescargas(models.Model):
    descarga_id = models.AutoField(primary_key=True)
    archivo_id = models.IntegerField()
    usuario_id = models.IntegerField()
    fecha_descarga = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'historial_descargas'
        managed = False

    def __str__(self):
        return f"Descarga {self.descarga_id}"


# Modelo para la tabla Version_Diseno
class VersionDiseno(models.Model):
    version_id = models.AutoField(primary_key=True)
    archivo_id = models.IntegerField()
    version_numero = models.IntegerField()
    fecha_version = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'version_diseno'
        managed = False

    def __str__(self):
        return f"Versión {self.version_id} de archivo {self.archivo_id}"

