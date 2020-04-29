from .models import TrainCurrencies
from django import forms

class UploadNewCurrencyForm(forms.ModelForm):
    imagesCurrency= forms.FileField(widget=forms.FileInput(attrs={'onchange': 'loadFile(event)'}))
    currencyValue= forms.CharField(label='search',
                    widget=forms.TextInput(attrs={'placeholder': 'enter currency value'}))
    currencyName = forms.CharField(label='search',
                                    widget=forms.TextInput(attrs={'placeholder': 'enter currency name'}))
    country = forms.CharField(label='search',
                                    widget=forms.TextInput(attrs={'placeholder': 'enter country name'}))
    class Meta:
        model = TrainCurrencies
        fields = ('currencyValue', 'currencyName', 'country', 'imagesCurrency',)