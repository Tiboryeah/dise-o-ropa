from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status

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

class SignUpView(APIView):
    def post(self, request, *args, **kwargs):
        serializer = CuentaSerializer(data=request.data)
        
        if serializer.is_valid():
            # Encriptar la contraseña antes de guardar el usuario
            serializer.validated_data['password'] = make_password(serializer.validated_data['password'])
            user = Cuenta.objects.create(**serializer.validated_data)
            return Response({"message": "Usuario creado con éxito"}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    
class LoginView(APIView):
    def post(self, request, *args, **kwargs):
        #logica de login
        return Response({"message": "Login successful"}, status=status.HTTP_200_OK)    