create_virtualenv:
	virtualenv geo-venv --python python3

install_django:
	pip install django

install_base_geospatial_libraries:
	sudo apt-get install binutils libproj-dev gdal-bin libgeoip1 python-gdal

install_geos:
	# install GEOS
	wget https://download.osgeo.org/geos/geos-3.7.0.tar.bz2
	tar xjf geos-3.7.0.tar.bz2

	cd geos-3.7.0; /.configure
  cd geos-3.7.0; make
	cd geos-3.7.0; sudo make install

install_proj4:
	# install PROJ.4
	wget https://download.osgeo.org/proj/proj-5.2.0.tar.gz
	wget https://download.osgeo.org/proj/proj-datumgrid-1.8.tar.gz

	tar xzf proj-5.2.0.tar.gz
	cd proj-5.2.0/nad; tar xzf ../../proj-datumgrid-1.8.tar.gz

	cd proj-5.2.0/; ./configure; make; sudo make install

install_gdal:
	# install GDAL
	wget https://download.osgeo.org/gdal/2.3.2/gdal-2.3.2.tar.gz
	tar xzf gdal-2.3.2.tar.gz

	cd gdal-2.3.2; ./configure; make; sudo make install

download_data:
	mkdir world/data
	cd world/data; wget https://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip; unzip TM_WORLD_BORDERS-0.3.zip
