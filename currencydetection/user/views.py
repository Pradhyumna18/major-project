from django.shortcuts import render,redirect
from django.core.files.storage import FileSystemStorage
from .check import comp
from currencydetection.settings import BASE_DIR
import os
import cv2
from PIL import Image
from admins.models import TrainCurrencies
from .models import UserRegistration,CurencyCheck
from django.db.models import Count
import PIL
#import Image

def home(request):
    if request.method=="POST":
        cur=request.FILES['testcur']
        fs = FileSystemStorage()
        filename = fs.save(cur.name, cur)
        uploaded_file_url = fs.url(filename)
        pat=os.path.join(BASE_DIR, 'assets/media/'+filename)
        res=comp(pat)
        return redirect('gryscale',res)
    return render(request,'home.html',)
    
def viewlist(request,pk):
    message=''
    if pk=='0':
        obj=None
        message='There is no matching currencies'
    else:
        obj=TrainCurrencies.objects.get(id=pk)
    return render(request,'viewlist.html',{'obj':obj,'message':message})
   
def index(request):
    if request.method=="POST":
        username=request.POST.get('username','')
        password=request.POST.get('password','')
        try:
            users=UserRegistration.objects.get(username=username,password=password)
            request.session['userid']=users.id
            request.session['username']=users.username
            return redirect('home')
        except:
            message="User name and password are not matching..."
    return render(request,'index.html',)
    
def registration(request):
    if request.method=="POST":
        username=request.POST.get('username','')
        password=request.POST.get('password','')
        email=request.POST.get('email','')
        mobile=request.POST.get('mobile','')
        location=request.POST.get('location','')
        UserRegistration.objects.create(username=username,password=password,mobilenum=mobile,emailId=mobile,location=location)
        return redirect('index')
    return render(request,'registration.html',)
    
def moneylist(request):
    det=TrainCurrencies.objects.all()
    return render(request,'moneylist.html',{'det':det})
    
def charts(request):
    clusterw = CurencyCheck.objects.all().values('curency').annotate(total=Count('curency'))
    return render(request,'charts.html',{'cur':clusterw})
    
def charts2(request):
    clusterw = CurencyCheck.objects.all().values('country').annotate(total=Count('country'))
    return render(request,'charts2.html',{'cur':clusterw})
    
def logout(request):
    return redirect('index')

def gryscale(request,pk):
    message = ''
    if pk == '0':
        obj = None
        message = 'There is no matching currencies'
    else:
        obj = TrainCurrencies.objects.get(id=pk)
        ast=obj.imagesCurrency.url
        pat=os.path.join(BASE_DIR,'assets/'+ast)
        ss=str(pat)
        image = cv2.imread(pat)
        b = image.copy()
        b[:, :, 1] = 0
        b[:, :, 2] = 0
        g = image.copy()
        g[:, :, 0] = 0
        g[:, :, 2] = 0
        r = image.copy()
        r[:, :, 0] = 0
        r[:, :, 1] = 0
        cv2.imshow('B-RGB', b)
        redimg=os.path.join(BASE_DIR, 'assets/static/image/ri.png')
        greimg=os.path.join(BASE_DIR, 'assets/static/image/gi.png')
        bluimg=os.path.join(BASE_DIR, 'assets/static/image/bi.png')
        cv2.imwrite(redimg,r)
        cv2.imwrite(greimg,g)
        cv2.imwrite(bluimg,b)
       # picture = Image.open(ss)
        #width, height = picture.size()
        #for x in width:
         #   for y in height:
          #      current_color = picture.getpixel( (x,y) )
           #     picture.putpixel( (x,y), new_color)
        img = Image.open(ss).convert('LA')
        im = PIL.Image.open(ss)
        im.point(lambda x: x * 250)
        pat1=os.path.join(BASE_DIR, 'assets/static/image/greyscale.png')
        pat2=os.path.join(BASE_DIR, 'assets/static/image/rgba.png')
        im.save(pat2)
        img.save(pat1)

    return render(request,'gryscale.html',{'obj':obj,'message':message,'pk':pk})