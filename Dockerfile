# # syntax=docker/dockerfile:1

FROM i386/alpine:latest
USER root
COPY analizerapp ./analizerapp/

RUN apk add --no-cache wine xvfb
ENV DISPLAY :99

RUN echo "Xvfb :99 -screen 0 640x480x8 -nolisten tcp &" > run.sh
RUN echo "wine ./analizerapp/LIMSAnalyzers.exe &" >> run.sh

# ENTRYPOINT ["sh", "./run.sh"]
ENTRYPOINT ["bin/sh"]
# 172.17.0.3/16