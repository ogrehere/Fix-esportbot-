FROM debian:latest

RUN apt update && apt upgrade -y && \
    apt install -y git curl python3-pip ffmpeg && \
    pip3 install -U pip && \
    curl -sL https://deb.nodesource.com/setup_15.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm

WORKDIR /app/
COPY . /app/
RUN pip3 install -U -r requirements.txt

CMD python3 main.py
