FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /timeswap
WORKDIR /timeswap

COPY Gemfile /timeswap/Gemfile
COPY Gemfile.lock /timeswap/Gemfile.lock

RUN bundle install
COPY . /timeswap
