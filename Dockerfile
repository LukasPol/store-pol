FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs libpq-dev postgresql-client

## install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /home/app/webapp/tmp/pids
WORKDIR /home/app/store
ADD . /home/app/store
# COPY Gemfile /store/Gemfile
# COPY Gemfile.lock /store/Gemfile.lock

##
# RUN gem install bundler:2.0.2
# RUN bundle check || bundle install
# RUN bundle exec rake webpacker:install
# COPY . /myapp

## Add Endpoint
COPY ./entrypoint.sh  /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"
RUN gem install bundler:2.1.4
