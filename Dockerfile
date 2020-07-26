FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /courses_api
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# install bundler
RUN gem install bundler

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME
