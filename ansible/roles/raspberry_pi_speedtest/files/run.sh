#!/usr/bin/env bash
echo "Starting run.sh"

cat /opt/docker-speedtest-analyser/crontab.default > /opt/docker-speedtest-analyser/crontab

if [[ ${CRONJOB_ITERATION} && ${CRONJOB_ITERATION-x} ]]; then
    sed -i -e "s/0/*\/${CRONJOB_ITERATION}/" /opt/docker-speedtest-analyser/crontab
fi

sed -i -e "s/\$SPEEDTEST_PARAMS/${SPEEDTEST_PARAMS}/" /opt/docker-speedtest-analyser/crontab

chmod 0644 /opt/docker-speedtest-analyser/crontab

crontab /opt/docker-speedtest-analyser/crontab

cron -f

exit 1;