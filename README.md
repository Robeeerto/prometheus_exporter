robeeerto/prometheus_exporter Container
===================================

![release](https://img.shields.io/github/release/tri-star/docker-prometheus-exporter.svg?style=flat-square)
![license](https://img.shields.io/badge/license-MIT-blue.svg?style=flat-square)

# Overview
A docker container which includes `prometheus_exporter` ruby gem.
It's usefull for monitor multi process ruby applications.

## Usage

Start container:
```
docker image build --build-arg VERSION=RUBY-VERSION_YOU_WANT -t IMAGE_NAME_YOU_WANT .
docker run --rm -p 9394:9394 IMAGE_NAME_YOU_NAMED
```

Application side:

On the application side, customize exporter client setting is required, because prometheus_exporter client is connect to localhost by default.
``` ruby
require 'prometheus_exporter/middleware'
require 'prometheus_exporter/client'

# Change default client instance.
# ENV['CONTAINER_HOST'] is a placeholder.
prometheus_client = PrometheusExporter::Client.new(host: ENV['CONTAINER_HOST'])
PrometheusExporter::Client.default = prometheus_client

Rails.application.middleware.unshift PrometheusExporter::Middleware
```

## Contribution

1. Fork ([https://github.com/Robeeerto/robeeerto-prometheus_exporter/fork](https://github.com/Robeeerto/robeeerto-prometheus_exporter/fork))
2. Create a feature branch
3. Commit your changes
4. Rebase your local changes against the master branch
5. Run the container, and verify your change works.
6. Create new Pull Request

## Licence

[MIT](https://github.com/Robeeerto/prometheus_exporter/blob/main/LICENSE)

## Author

[Robeeerto](https://github.com/Robeeerto)
