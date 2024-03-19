FROM nikolaik/python-nodejs:python3.9-nodejs16

WORKDIR /app
COPY . /app

RUN apt-get update && \
    apt-get install -y ffmpeg && \
    chmod 777 /app && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install --no-cache-dir -U -r requirements.txt

CMD ["python3", "main.py"]
