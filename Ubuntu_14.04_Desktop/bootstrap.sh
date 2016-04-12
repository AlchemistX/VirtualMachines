#!/bin/bash
sudo route add default gw 192.168.0.1
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install git valac intltool libtool texinfo autopoint flex \
                        yelp-tools gnome-common gtk-doc-tools libasound2-dev \
                        libxml2-dev libxv-dev libpng-dev

