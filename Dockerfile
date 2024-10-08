FROM ubuntu

WORKDIR /app

COPY requirements.txt /app
COPY Devops /app

#install python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip 

#create python virtual environment
RUN python3 -m venv /app/venv
# install python packages from virtual environment
RUN /app/venv/pip install --upgrade pip && \
    /app/venv/pip install -r requirements.txt 
#copy the code
COPY Devops /app

# Set environment variables for virtual environment
ENV PATH="/app/venv/bin:$PATH"
#command
ENTRYPOINT ["python3"]
CMD ["manage.py","runserver","0.0.0.0:8000"]
