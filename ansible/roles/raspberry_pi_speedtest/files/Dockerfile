FROM python:buster

# install dependencies
RUN apt-get update && apt-get install -y \
  cron

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