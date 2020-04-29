from django.db import models

class TrainCurrencies(models.Model):
    currencyValue = models.IntegerField(default=0)
    currencyName = models.CharField(max_length=200)
    country = models.CharField(max_length=200)
    imagesCurrency = models.FileField(upload_to='train/')