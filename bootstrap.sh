#!/usr/bin/env bash

sshd_config_path="/usbkey/ssh/sshd_config"
tmp_sshd_config_path="/tmp/new_sshd_config"

sed \
  -e 's/PasswordAuthentication yes/PasswordAuthentication no/g' \
  -e 's/PermitRootLogin yes/PermitRootLogin without-password/g' \
  $sshd_config_path > $tmp_sshd_config_path \
  && \
  mv $tmp_sshd_config_path $sshd_config_path

ak_config_path="/usbkey/config.inc/authorized_keys"
mkdir /usbkey/config.inc
touch "$ak_config_path"

declare -a keys=(
  "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
);

for key in "${keys[@]}"
do
  echo "$key" | tee -a $ak_config_path
done

echo "root_authorized_keys_file=authorized_keys" | tee -a /usbkey/config
