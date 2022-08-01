# Jupyter Lab and Python Oracle Database modules in Docker


Runs Jupyter Lab in Docker Container with some extras installed: 

- ipywidgets
- numpy
- pandas
- matplotlib
- oracle instant client 21.7
- oracledb Python module
- cx_Oracle Python module (needs Oracle instant client above)

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
Originally tried to install Oracle Instant Client using conda command `conda install -y -c eumetsat oracle-instantclient` which completed successfully. However, it didn't actually work, e.g. running `cx_Oracle.clientversion()` gave error message` DPI-1047: Cannot locate a 64-bit Oracle Client library: "libaio.so.1`. 

Instead, switched to a direct install that relies on downloading a zip file and unpacking it. This is run in the Dockerfile. There is also one last bit of config in docker-compose.yml in the form of `ldconfig` in its last line. I have been able to use this successfully.