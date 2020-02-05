FROM hexpm/elixir:1.10.0-erlang-22.2.5-alpine-3.11.2 as build

# install build dependencies
RUN apk add --update git build-base openssl

# prepare build dir
RUN mkdir /app
WORKDIR /app

# install hex + rebar
RUN  mix local.hex --force && mix local.rebar --force
RUN  rebar3 compile
