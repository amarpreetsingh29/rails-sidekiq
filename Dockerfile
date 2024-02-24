FROM ruby:3.0.0
WORKDIR /rails-sidekiq
COPY Gemfile* ./
RUN bundle install
COPY . .
EXPOSE 3000
CMD rails s
