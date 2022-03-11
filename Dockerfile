FROM abing/abing-userbot:busterv2
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN git clone -b Abing-Userbot https://github.com/nabilrmdaan/Abing-Userbot /home/Abing-Userbot/ \
    && chmod 777 /home/Abing-Userbot \
    && mkdir /home/Abing-Userbot/bin/
WORKDIR /home/Abing-Userbot/
COPY ./sample_config.env ./config.env* /home/Abing-Userbot/
RUN pip install -r requirements.txt
CMD ["python3", "-m", "userbot"]
