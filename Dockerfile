FROM cymagix/python-for-pyodbc-sqlserver

# .env
ENV DATABASE_USERNAME='sqlserver'
ENV DATABASE_PASSWORD='P4SSW0RD!'
ENV DATABASE_HOST='127.0.0.1'
ENV APPLICATION_DB='tmpdb'  

# timezone
ENV TZ Australia/Brisbane

# add your application code and set the working directory
ADD . /app
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 22
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--reload", "--port", "8000"]
