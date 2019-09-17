FROM ruby:2.6.4

ENV APP_HOME /myapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

CMD bundle exec jekyll serve
EXPOSE 4000
