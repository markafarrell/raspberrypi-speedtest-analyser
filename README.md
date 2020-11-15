raspberrypi-speedtest-analyser
==============================

An ansible project to turn a raspberry pi into a mobile network speedtesting robot

1. This is based on using an Android phone using USB tethering to provide connectivity. If you are using another kind of device you will need to change the `mobile_interface_ip_address` and `mobile_gateway` to appropriate ip addresses for your setup

2. You will need to add the ip address (or hostname) of your raspberry pi to your hosts file so that `raspberrypi-speedtest-analyser` will resolve to the ip address of the raspberry pi you are targeting. Alternatively you can modify the inventory file.

3. Run the `configure.yml` playbook to configure the raspberry pi `ansible-playbook -i inventory/ configure.yml` (the command must be run in the `ansible` directory of this project)

4. Navigate to http://raspberrypi-speedtest-analyser in your browser to view the results. (default grafana credentials are admin:admin)