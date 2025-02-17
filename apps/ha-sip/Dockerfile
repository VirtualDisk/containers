FROM ghcr.io/virtualdisk/git:v2.47.2 AS git
RUN git clone https://github.com/arnonym/ha-plugins.git /git

FROM docker.io/homeassistant/amd64-base-python:3.11-alpine3.16@sha256:4b36bbf5d25863dda84eaebc24a2a4e811b33da0b0a9f4b5ecb362a69b3f20f7
ENV LANG C.UTF-8

RUN apk update
RUN apk upgrade
RUN apk add build-base openssl-dev alsa-lib-dev gsm-dev opus-dev speex-dev speexdsp-dev portaudio-dev libsrtp-dev libsamplerate-dev linux-headers python3-dev swig ffmpeg git

RUN pip3 install pydub requests PyYAML typing_extensions python-dotenv paho-mqtt

RUN git clone --depth 1 --branch 2.14.1 https://github.com/pjsip/pjproject.git /tmp/pjproject

COPY --from=git /git/ha-sip/user.mak /tmp/pjproject

WORKDIR /tmp/pjproject

RUN set -xe \
    && ./configure --enable-shared --disable-libwebrtc \
    && make \
    && make dep \
    && make install \
    && cd pjsip-apps/src/swig \
    && make python \
    && make -C python install \
    && cd / \
    && rm -rf /tmp/pjproject

COPY --from=git /git/ha-sip/run.sh /
RUN chmod a+x /run.sh

COPY --from=git /git/ha-sip/src /ha-sip

CMD [ "/run.sh" ]
