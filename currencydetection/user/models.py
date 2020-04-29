from django.db import models
from admins.models import TrainCurrencies

class UserRegistration(models.Model):
    username = models.CharField(max_length=200)
    password = models.CharField(max_length=50)
    mobilenum = models.IntegerField()
    emailId = models.EmailField(max_length=100)
    location = models.CharField(max_length=100)

class CurencyCheck(models.Model):
    curency = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    currencyValue = models.CharField(max_length=200)
    curobj = models.ForeignKey(TrainCurrencies)
    file_path=models.CharField(max_length=200)