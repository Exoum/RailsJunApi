FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /RailsJuniorApi
COPY Gemfile /RailsJuniorApi/Gemfile
COPY Gemfile.lock /RailsJuniorApi/Gemfile.lock
RUN bundle install
COPY . /RailsJuniorApi


COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


CMD ["rails", "server", "-b", "0.0.0.0"]
