FROM python:3.9-slim-bullseye
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="Asia/Kolkata"
RUN apt-get -qq update && \
    apt-get -qq install -y git ffmpeg mediainfo build-essential mkvtoolnix fontconfig && \
    rm -rf /var/lib/apt/lists/*
COPY . .
RUN python3 -m pip install --upgrade pip 
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
