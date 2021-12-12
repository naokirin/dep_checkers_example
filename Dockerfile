FROM ruby:2.7-alpine3.12

ENV LANG ja_JP.UTF-8

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        linux-headers \
        libc-dev \
        libxml2-dev \
        nodejs \
        npm \
        sqlite-dev \
        tzdata \
        shared-mime-info \
        yarn && \
    apk add --virtual=.build-deps --no-cache \
        gcc \
        g++ \
        make \
        build-base \
        curl-dev

RUN gem install bundler

RUN mkdir -p /reports
WORKDIR /app
COPY ./web /app

RUN bundle install
RUN yarn install && yarn upgrade && yarn cache clean
EXPOSE 3000

# Normally starts rails server
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
