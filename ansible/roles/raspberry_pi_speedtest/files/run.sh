#!/usr/bin/env bash
echo "Starting run.sh"

cat /opt/docker-speedtest-analyser/crontab.default > /opt/docker-speedtest-analyser/crontab

if [[ ${CRONJOB_ITERATION} && ${CRONJOB_ITERATION-x} ]]; then
    sed -i -e "s/0/*\/${CRONJOB_ITERATION}/" /opt/docker-speedtest-analyser/crontab
fi
crontab /opt/docker-speedtest-analyser/crontab

crond -l 2 -f

exit 1;