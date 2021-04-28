from django.urls import path
import wordcnt.views

app_name="wordcnt"

urlpatterns = [
    path('', wordcnt.views.wordinput,name="wordinput"),
    path('result/',wordcnt.views.result,name="result"),  #ctrl누르고 'views'누르면  ==> wordcnt의views로 감
    path('about/',wordcnt.views.about, name="about")
]