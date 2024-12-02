from django.shortcuts import render

from rest_framework import viewsets
from .models import Cuenta, Disenador, TipoPrenda, Prenda, Diseno
from .serializers import CuentaSerializer, DisenadorSerializer, TipoPrendaSerializer, PrendaSerializer, DisenoSerializer

class CuentaViewSet(viewsets.ModelViewSet):
    queryset = Cuenta.objects.all()
    serializer_class = CuentaSerializer

class DisenadorViewSet(viewsets.ModelViewSet):
    queryset = Disenador.objects.all()
    serializer_class = DisenadorSerializer

class TipoPrendaViewSet(viewsets.ModelViewSet):
    queryset = TipoPrenda.objects.all()
    serializer_class = TipoPrendaSerializer

class PrendaViewSet(viewsets.ModelViewSet):
    queryset = Prenda.objects.all()
    serializer_class = PrendaSerializer

class DisenoViewSet(viewsets.ModelViewSet):
    queryset = Diseno.objects.all()
    serializer_class = DisenoSerializer
