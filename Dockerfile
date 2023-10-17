FROM ruby:3.2.2

RUN apt update -qq && apt install -y postgresql-client
RUN mkdir /app

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
