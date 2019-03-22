#!/usr/bin/env bash

if [[ $(id -u) != 0 ]]; then
    echo "Script must be run as root."
    exit 1
fi

cp lastep.sh /bin/lastep.sh

chmod u+x /bin/lastep.sh

echo "[Unit]
Description=Launches lastep.sh with directories to report last accessed episode in
After=network.target

[Service]
Type=oneshot" > /etc/systemd/system/lastep.service

echo "List directories to be checked separated by spaces:"
read dirs

for dir in $dirs; do
  echo "ExecStart=/bin/lastep.sh $dir" >> /etc/systemd/system/lastep.service
done

echo "
[Install]
WantedBy=multi-user.target" >> /etc/systemd/system/lastep.service

systemctl enable lastep
