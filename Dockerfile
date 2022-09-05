FROM ruby:3.0
WORKDIR /mySite
COPY Gemfile /mySite/Gemfile
COPY Gemfile.lock /mySite/Gemfile.lock
RUN bundle install

CMD rails s