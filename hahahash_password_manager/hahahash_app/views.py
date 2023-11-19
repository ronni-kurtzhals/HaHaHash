from django.shortcuts import render
from rest_framework import generics
from .models import PasswordEntry
from .serializers import PasswordEntrySerializer

# Create your views here.

class PasswordEntryList(generics.ListCreateAPIView):
    queryset = PasswordEntry.objects.all()
    serializer_class = PasswordEntrySerializer


class PasswordEntryDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = PasswordEntry.objects.all()
    serializer_class = PasswordEntrySerializer