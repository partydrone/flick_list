FROM ruby:2.6

LABEL maintainer="Andrew Porter <partydrone@icloud.com>"

RUN apt-get update && apt-get install nodejs

WORKDIR /srv/app

COPY Gemfile* ./
RUN bundle install --binstubs

COPY . .

CMD puma -C config/puma.rb
