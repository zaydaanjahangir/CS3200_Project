# Use an official Python runtime as a parent image based on Alpine
FROM python:3.9-alpine

# Set the working directory in the container to /code
WORKDIR /code

# Install system dependencies required for mysqlclient and other packages
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    mariadb-dev \
    python3-dev \
    libffi-dev \
    openssl-dev

# Copy the requirements.txt file from the host system to inside the container
COPY src/requirements.txt .

# Install Python dependencies
RUN pip install --upgrade pip && pip install -r requirements.txt

# Expose port 4000 from the container
EXPOSE 4000

# Copy the rest of the application
COPY src/ .

# Command to run the application
CMD ["python", "app.py"]
