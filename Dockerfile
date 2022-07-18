FROM cymagix/python-for-pyodbc-sqlserver

# .env
ENV DATABASE_USERNAME=''
ENV DATABASE_PASSWORD=''
ENV DATABASE_HOST=''
ENV APPLICATION_DB=''  

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
