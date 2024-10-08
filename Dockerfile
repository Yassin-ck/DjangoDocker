FROM ubuntu

WORKDIR /app

COPY requirements.txt /app
COPY Devops /app

RUN apt-get update && \
    apt-get install -y python3 pip && \
    pip install -r requirements.txt && \
    cd Devops

ENTRYPOINT ["python3"]
CMD ["manage.py","runserver","0.0.0.0:8000"]
