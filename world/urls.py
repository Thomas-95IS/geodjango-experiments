from django.urls import path

from . import views


app_name = 'world'
urlpatterns = [
    path('map/', views.geojson, name='geojson'),
    path('google-map/', views.googlemap, name='googlemap')
]
