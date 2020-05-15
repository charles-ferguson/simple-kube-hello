FROM debian:buster-slim

RUN adduser --disabled-password --gecos '' app-runner &&\
  mkdir /home/app-runner/app &&\
  apt-get update &&\
  apt-get install --yes ruby-full &&\
  gem install bundler

WORKDIR /home/app-runner/app
USER app-runner
COPY --chown=app-runner:app-runner . .
RUN bundle install
EXPOSE 4567/tcp

ENTRYPOINT ["bundle", "exec", "app.rb"]
