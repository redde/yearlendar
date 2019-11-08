FROM ruby:2.6

RUN mkdir /yearlendar

WORKDIR /yearlendar

ADD Gemfile Gemfile.lock ./
RUN bundle install
ADD . .
CMD puma -C puma.rb
