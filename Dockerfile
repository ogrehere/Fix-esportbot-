FROM debian:latest

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y git curl python3-pip ffmpeg \
    && pip3 install -U pip \
    && curl -sL https://deb.nodesource.com/setup_15.x | bash - \
    && apt-get install -y nodejs \
    && npm i -g npm

# Set up the working directory and copy the application code
RUN mkdir /app/
WORKDIR /app/
COPY . /app/

# Install Python dependencies
RUN pip3 install -U -r requirements.txt

# Define the command to run the application
CMD python3 main.py
