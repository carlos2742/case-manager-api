FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /case-manager-api
WORKDIR /case-manager-api
COPY Gemfile /case-manager-api/Gemfile
COPY Gemfile.lock /case-manager-api/Gemfile.lock
RUN bundle install
COPY . /case-manager-api

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]