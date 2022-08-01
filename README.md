# Jupyter Lab in Docker


Runs Jupyter Lab in Docker Container with some extras installed: 

- ipywidgets
- numpy
- pandas
- matplotlib
- oracle instant client **(note this doesn't work - config needed?)**
- oracledb Python module
- cx_Oracle Python module

Idea is to use it to extract and visualise data from Oracle Databases.

Partly based on information found here:  https://towardsdatascience.com/dockerizing-jupyter-projects-39aad547484a 

## How to run
1. Clone this repo
2. If not already installed, install Docker and docker compose.
3. Change directory to the repo directory.
4. Run `docker-compose up` in terminal
5. When you see `Jupyter Server 1.18.1 is running at` message, open http://localhost:8888/lab?token=docker in browser.
6. Note the `notebooks` sub directory is mounted as volume `/notebooks` in the docker container. This can be changed or extended by updating the volumes section of docker-compose.yml.

## Oracle Client Problem
Oracle instant client does not seem to be working within the container. Note this isn't necessarily a problem as oracledb Python module can connect to databases without instant client, except in the case of some older database versions.

### Details of problem
Oracle Instant Client was installed using conda command `conda install -y -c eumetsat oracle-instantclient` which completed successfully. However, running `cx_Oracle.clientversion()` gives error ` DPI-1047: Cannot locate a 64-bit Oracle Client library: "libaio.so.1`. This file does not seem to be present on the container. Also there's no directory `/usr/lib/oracle` in which instant client files can be expected to be found.