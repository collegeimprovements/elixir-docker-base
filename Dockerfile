FROM elixir:1.9.4-alpine as build

# install build dependencies
RUN apk add --update git build-base openssl

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN  mix local.hex --force && mix local.rebar --force
RUN  rebar3 compile
