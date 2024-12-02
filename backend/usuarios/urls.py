from django.urls import path
from . import views  # Esto debería apuntar a las vistas de la carpeta de la app, no a 'migrations'

urlpatterns = [
    path('login/', views.LoginView.as_view(), name='login'),
    path('signup/', views.SignUpView.as_view(), name='signup'),
    # Agrega las rutas necesarias para tus vistas
]

