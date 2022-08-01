FROM continuumio/miniconda3

# Standard conda installs
RUN conda install -y \
    numpy \
    pandas \
    matplotlib \
    jupyterlab

# Conda installs from specific channels
# instantclient installer completes but the client doesn't work
# switch to direct install further down
## RUN conda install -y -c eumetsat oracle-instantclient
RUN conda install -y -c conda-forge ipywidgets

# Pip installs (oracledb not available from conda?)
RUN pip install oracledb cx_Oracle

# Oracle instant client install
# (unzip needed installation, libaio1 needed for oracle client to actually work)
RUN apt update
RUN apt install -y unzip libaio1
# Oracle client zip file download and extract
RUN mkdir -p /opt/oracle
# cd doesn't persist here but can use WORKDIR to change default dir
WORKDIR /opt/oracle
RUN wget https://download.oracle.com/otn_software/linux/instantclient/217000/instantclient-basiclite-linux.x64-21.7.0.0.0dbru.zip -O basiclite.zip
RUN unzip basiclite.zip
# Config thing (note ldconfig command in docker-compose.yml too)
RUN sh -c "echo /opt/oracle/instantclient_21_7 > /etc/ld.so.conf.d/oracle-instantclient.conf"
