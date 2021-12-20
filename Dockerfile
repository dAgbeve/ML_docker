# On managing my various AI/ML projects

FROM jupyter/scipy-notebook:latest

MAINTAINER Douglas Agbeve <douglas@agbeve.com>

USER root

#get things started
RUN set -eux; \
        apt-get update; \
        apt-get install -y build-essential gcc; \
        apt-get install gosu; \
        apt-get install -y software-properties-common; \
        add-apt-repository ppa:ubuntugis/ppa; \
        apt-get update; \
        apt-get install -y gdal-bin libgdal-dev graphviz firefox xauth; \
        gosu ${NB_UID}:1 id; 

USER ${NB_UID}

RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

#Install Tensorflow
RUN pip3 install tensorflow
RUN pip3 install rasterio
RUN pip3 install richdem
RUN pip3 install pydot
#RUN conda install -c giswqs pygdal
#EXPOSE 6006
#EXPOSE 8887

CMD firefox
