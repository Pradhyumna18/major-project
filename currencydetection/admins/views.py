from django.shortcuts import render, redirect
from .models import TrainCurrencies
from .forms import UploadNewCurrencyForm
from user.models import CurencyCheck
from django.db.models import Count

def index(request):
    if request.method=="POST":
        username=request.POST.get('username','')
        password=request.POST.get('password','')
        if username=="admin" and password=="admin":
            return redirect('adminshome')
    return render(request,'admins/index.html',)

def home(request):
    det=TrainCurrencies.objects.all()
    return render(request,'admins/home.html',{'det':det})

def uploadNew(request):
    form = UploadNewCurrencyForm(request.POST, request.FILES)
    if form.is_valid():
        form.save()
        return redirect('adminshome')
    else:
        form = UploadNewCurrencyForm()
    return render(request,'admins/upload.html',{'form':form})

def charts(request):
    clusterw = CurencyCheck.objects.all().values('curency').annotate(total=Count('curency'))
    return render(request,'admins/charts.html',{'cur':clusterw})
    
def charts2(request):
    clusterw = CurencyCheck.objects.all().values('country').annotate(total=Count('country'))
    return render(request,'admins/charts2.html',{'cur':clusterw})
    
def currencycheck(request):
    curchk=CurencyCheck.objects.all()

    return render(request,'admins/currencycheck.html',{'curchk':curchk})
    
def logout(request):
    return redirect('adminsindex')