# Use Ubuntu
FROM ubuntu:20.04 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt to the working directory
COPY requirements.txt /app

# Install Python and necessary tools
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean


# Activate the virtual environment and install the dependencies
# Log the output of the installation to ensure it's happening
RUN pip install --upgrade pip && \
    pip install -r requirements.txt --verbose

# Copy the rest of the application code
COPY . /app/

# Expose port 8000
EXPOSE 8000

##################################################
# STAGE 2
##################################################
FROM gcr.io/distroless/python3

# Copy the application and venv from the build stage
COPY --from=build /app /app


# Run the Django development server
ENTRYPOINT ["python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]

