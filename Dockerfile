FROM continuumio/miniconda3

# Standard conda installs
RUN conda install -y \
    numpy \
    pandas \
    matplotlib \
    jupyterlab

# Conda installs from specific channels
RUN conda install -y -c eumetsat oracle-instantclient
RUN conda install -y -c conda-forge ipywidgets

# Pip installs (oracledb not available from conda?)
RUN pip install oracledb cx_Oracle
