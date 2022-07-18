# fastapi-pyodbc-ms-sql-server

A sample RestAPI using FastAPI and pyodbc to connect to a Microsoft SQL Server Database.

- [FastAPI](https://fastapi.tiangolo.com/)
- [pyodbc](https://pypi.org/project/pyodbc/)
- [SQL Server](https://docs.microsoft.com/en-us/sql/sql-server/)

## How to use

1. Prepare a SQL Server Database, DB user and password, also DB host.
2. Rewrite ENV of Dockerfile with your own DB infos.
3. Build A Docker instance and run it.
4. Test DB connection, and then do whatever you want.

## Setup development environment

Please install `Docker` and `Docker compose` first.

https://www.docker.com/

After installation, run the following command to create a local Docker container.

```bash
docker-compose build
docker-compose up -d
```

If you want to check the log while Docker container is running, then try to use following command:

```bash
docker-compose up
```

If Docker is running successfully, the API and DB server will be launched as shown in the following:

- API server: http://localhost:8000

*Be careful, it won't work if the port is occupied by another application.*

If you want to check docker is actually working, then you can check it with following command:

```bash
docker ps
```

If you want to go inside of docker container, then try to use following command:

```bash
docker-compose exec fast_api bash
```

For shutdown of the docker instance, please use following command:

```bash
docker-compose down
```

## Production deployment

Build a docker image:

```
docker build -f ./Dockerfile -t fastapi-sql-server-app . --platform linux/amd64 --no-cache
```

And then push it to your repository:  
(The following is just an example.)

```
docker tag fastapi-sql-server-app gcr.io/your-project-of-gcp/fastapi-sql-server-app
docker push gcr.io/your-project-of-gcp/fastapi-sql-server-app
```
