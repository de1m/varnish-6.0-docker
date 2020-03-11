#!/bin/bash

apt update && apt install curl git autotools-dev automake libtool python-docutils libmhash-dev python-pip -y
curl -s https://packagecloud.io/install/repositories/varnishcache/varnish60lts/script.deb.sh | bash
apt-get install varnish-dev -y 

echo install varnish-modules...
cd /tmp
git clone https://github.com/varnish/varnish-modules.git -b 6.0-lts
cd /tmp/varnish-modules/
./bootstrap
./configure
make
make install

ls /tmp | grep -v varnish-install.sh | xargs rm -Rf

echo install varnish libvmod-digest....
cd /tmp
git clone https://github.com/varnish/libvmod-digest.git -b 6.0-lts
mv /tmp/libvmod-digest/* /tmp/
./autogen.sh
autoreconf -i
./configure
make
make install

ls /tmp | grep -v varnish-install.sh | xargs rm -Rf

echo instasll libvmod-re ...
cd /tmp
git clone https://code.uplex.de/uplex-varnish/libvmod-re.git -b 6.0
mv /tmp/libvmod-re/* /tmp/
./autogen.sh
./configure
make
make install

ls /tmp | grep -v varnish-install.sh | xargs rm -Rf

pip install s3cmd
