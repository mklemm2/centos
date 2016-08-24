#!/bin/bash -eux

echo '==> Adding zram init script'
if [[ "${PACKER_BUILDER_TYPE}" =~ "virtualbox" ]]; then
  mv /tmp/zram.init /etc/init.d/zram
  chown root:root /etc/init.d/zram
  chmod a+x /etc/init.d/zram
  chkconfig --add zram
  echo '==> zram init script added and activated'
else
  echo '==> No zram on this platform, yet.'
fi
