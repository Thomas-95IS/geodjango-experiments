from django.core.serializers import serialize
from django.shortcuts import render
from .models import WorldBorder


def geojson(request):
    layer = WorldBorder.objects.filter(name='United Kingdom')
    geojson = serialize('geojson', layer)
    return render(request, 'world/map.html', {'my_geojson': geojson})
