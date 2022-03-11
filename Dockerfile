FROM abingex/abingxuserbot:busterv2
RUN apt-get update
RUN apt-get install -y --no-install-recommends \
    curl \
    git \
    ffmpeg
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    npm i -g npm
RUN git clone -b AbingxUserbot https://nabilrmdaan/nabilrmdaan/AbingxUserbot /home/AbingxUserbot/ \
    && chmod 777 /home/AbingxUserbot \
    && mkdir /home/AbingxUserbot/bin/
WORKDIR /home/AbingxUserbot/
COPY ./sample_config.env ./config.env* /home/AbingxUserbot/
RUN pip install -r requirements.txt
CMD ["python3", "-m", "userbot"]
