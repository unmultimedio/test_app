FROM ruby
RUN mkdir /my_app
WORKDIR /my_app
ADD Gemfile Gemfile.lock /my_app/
RUN echo "deb http://debian.uniminuto.edu/debian/ stable main contrib" > /etc/apt/sources.list \
    && apt-get update -qq \
    && apt-get install -y --no-install-recommends curl sudo \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y --no-install-recommends nodejs \
    && gem install bundler \
    && bundle install