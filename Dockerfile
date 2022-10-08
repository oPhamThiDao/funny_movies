FROM ruby:3.1.2

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libsqlite3-dev \
  sqlite3 && \
  curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

RUN gem install bundler --no-document
WORKDIR /usr/src/funny_movies

COPY Gemfile* ./
RUN bundle config --global path /bundle/cache
RUN bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . ./
RUN bundle exec rake db:migrate
EXPOSE 3000
