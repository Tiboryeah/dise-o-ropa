from rest_framework import serializers
from .models import Cuenta, Disenador, TipoPrenda, Prenda, Diseno

class CuentaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Cuenta
        fields = '__all__'

class DisenadorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Disenador
        fields = '__all__'

class TipoPrendaSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoPrenda
        fields = '__all__'

class PrendaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Prenda
        fields = '__all__'

class DisenoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Diseno
        fields = '__all__'
