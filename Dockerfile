# Use an official Python runtime as a parent image
FROM python:3.10-slim-buster
# Set the working directory in the container to /app
WORKDIR /app

# Install git
RUN apt-get update && apt-get install -y git
# Install curl
RUN apt-get update && apt-get install -y curl

# Copy the current directory contents into the container at /app 
COPY . /app
# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
#EXPOSE the port, for now default is 8080 cause it's the only one really allowed by HuggingFace
EXPOSE 9999

# Run run.py when the container launches
CMD ["python", "run.py"]