ARG VERSION

FROM ruby:${VERSION}-alpine
LABEL maintainer="robert@5xcampus.com"

COPY Gemfile* /

RUN gem install bundler:2.3.6 && \
    bundle install -j4 --retry 3 && \
    bundle clean --force && \
    find /usr/local/bundle -type f -name '*.c' -delete && \
    find /usr/local/bundle -type f -name '*.o' -delete && \
    rm -rf /usr/local/bundle/cache/*.gem

CMD ["/usr/local/bundle/bin/prometheus_exporter"]