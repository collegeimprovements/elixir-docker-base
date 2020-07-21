FROM elixir:1.10.4-alpine as build

# install build dependencies
# RUN apk add --update git build-base openssl inotify-tools vim
RUN apk add --no-cache --update build-base npm git python openssl inotify-tools vim

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN mix local.hex --force && mix local.rebar --force
RUN rebar3 compile
