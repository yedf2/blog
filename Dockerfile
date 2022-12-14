# syntax=docker/dockerfile:1
FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y sqlite3
WORKDIR /myapp
COPY . .
RUN bundle install
RUN bin/rails db:migrate && bin/rails db:seed

# Add a script to be executed every time the container starts.
ENTRYPOINT ["/myapp/entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["/myapp/bin/rails", "server", "-b", "0.0.0.0"]
