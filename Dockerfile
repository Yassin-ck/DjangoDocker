FROM ubuntu:latest

# Set working directory
WORKDIR /app

# Install Python, pip, and the venv package
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

# Copy requirements first to leverage Docker caching
COPY requirements.txt /app/

# Create a Python virtual environment
RUN python3 -m venv /app/venv

# Install Python packages from requirements.txt in the virtual environment
RUN /app/venv/bin/pip install --upgrade pip && \
    /app/venv/bin/pip install -r requirements.txt

# Copy the rest of the application code
COPY Devops /app/

# Set environment variables for virtual environment
ENV PATH="/app/venv/bin:$PATH"

# Set default command
ENTRYPOINT ["python3"]
CMD [ "manage.py", "runserver", "0.0.0.0:8000"]

