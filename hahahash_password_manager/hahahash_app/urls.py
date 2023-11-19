from django.urls import path
from .views import PasswordEntryList, PasswordEntryDetail

urlpatterns = [
    path('passwords/', PasswordEntryList.as_view(), name='password-list'),
    path('passwords/<int:pk>/', PasswordEntryDetail.as_view(), name='password-detail'),
]
