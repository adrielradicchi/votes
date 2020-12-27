FROM ruby:2.7.1-alpine

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python3 \
      tzdata \
      yarn

RUN gem install bundler -v 2.0.2
# RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
# RUN locale-gen
# RUN export LC_ALL="en_US.utf8"

ENV RAILS_ROOT /var/www/vote
RUN mkdir -p $RAILS_ROOT 
# Set working directory
WORKDIR $RAILS_ROOT
# Setting env up
# ENV RAILS_ENV='production'
# ENV RACK_ENV='production' 

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
COPY package.json yarn.lock ./

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
RUN yarn install --check-files

COPY . ${RAILS_ROOT}
RUN bundle exec rake assets:precompile

EXPOSE 3000
# CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
CMD ["rails", "db:migrate"]