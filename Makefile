create_virtualenv:
	sudo apt install virtualenv
	virtualenv geo-venv --python python3

install_atom:
	curl -sL https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
	sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
	sudo apt-get update
	sudo apt-get install atom

install_python_requirements:
	pip install -r requirements.txt

install_base_geospatial_libraries:
	sudo apt-get install build-essential binutils libproj-dev gdal-bin libgeoip1 python-gdal

install_geos:
	# install GEOS
	wget https://download.osgeo.org/geos/geos-3.7.0.tar.bz2
	tar xjf geos-3.7.0.tar.bz2

	cd geos-3.7.0; /.configure; make; sudo make install

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

install_postgis:
	sudo apt-get install postgis

download_data:
	mkdir world/data
	cd world/data; wget https://thematicmapping.org/downloads/TM_WORLD_BORDERS-0.3.zip; unzip TM_WORLD_BORDERS-0.3.zip

create_db:
	sudo -u postgres -i
	createdb geodjango;
	psql geodjango
	CREATE EXTENSION postgis;
	CREATE USER geodjango;
	ALTER ROLE geodjango with CREATEDB;
	ALTER ROLE geodjango with ENCRYPTED PASSWORD 'geodjango';
