FROM debian:jessie

ENV REPO https://github.com/squeek502/luvit-irc-activity-bot
ENV APP /srv/bot

RUN apt-get update
RUN apt-get install -y git curl
RUN git clone $REPO $APP
RUN curl -L https://github.com/luvit/lit/raw/master/get-lit.sh | sh

WORKDIR $APP
ADD config.lua $APP
RUN /lit install

ENTRYPOINT ["/luvit", "."]
