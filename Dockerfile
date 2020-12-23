FROM ruby:2.7.1

ENV NODE_VERSION 14

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs locales yarn

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

# RUN npm install -g yarn
# RUN mkdir /vote
ENV RAILS_ROOT /var/www/vote
RUN mkdir -p $RAILS_ROOT 
# Set working directory
WORKDIR $RAILS_ROOT
# Setting env up
# ENV RAILS_ENV='production'
# ENV RACK_ENV='production' 

COPY Gemfile Gemfile
# RUN bundle install
COPY Gemfile.lock Gemfile.lock
# RUN bundle install --jobs 20 --retry 5 --without development test 
RUN bundle install
# RUN rails db:purge db:create db:migrate db:seed RAILS_ENV=production
RUN rails db:purge db:create db:migrate db:seed

COPY . .
RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]