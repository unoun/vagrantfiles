FROM jupyter/datascience-notebook:latest

RUN conda install --quiet --yes \
    'pandas-datareader=0.2.1' \
    'pymysql=0.7.9' \
    'ipyleaflet=0.2.1' \
    && conda clean -tipsy
