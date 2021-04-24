FROM node:lts-alpine

LABEL maintainer="vyronfiee"

ARG JD_BASE_BRANCH=master

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
    LANG=zh_CN.UTF-8 \
    SHELL=/bin/bash \
    PS1="\u@\h:\w \$ "

COPY . /jd

WORKDIR /jd

RUN npm install && npm install -g pm2

EXPOSE 7744

CMD ["pm2","start","index.js","--no-daemon" ]
