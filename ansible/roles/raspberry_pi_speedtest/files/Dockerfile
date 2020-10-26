FROM alpine:3.9

# install dependencies
RUN apk update && apk add \
  bash \
  git \
  python3 \
  py-pip

RUN pip install prometheus_client

RUN pip install git+https://github.com/markafarrell/speedtest-cli.git@feature/results-to-prometheus-pushgateway

RUN mkdir -p /opt/docker-speedtest-analyser
COPY run.sh /opt/docker-speedtest-analyser/run.sh
COPY crontab.default /opt/docker-speedtest-analyser/crontab.default

# Make run.sh executable
RUN chmod 744 /opt/docker-speedtest-analyser/run.sh

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

ENTRYPOINT ["/opt/docker-speedtest-analyser/run.sh"]