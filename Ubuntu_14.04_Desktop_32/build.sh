#!/bin/bash
mkdir WORK
pushd WORK
git clone git://git.gnome.org/jhbuild
pushd jhbuild
git checkout 2e9f787b8ae8db84da57e9efd226e806d009e9ad
./autogen.sh
./configure
make install

if grep -q UNDER_JHBUILD ~/.bashrc
then
  echo '' > /dev/null
else
  echo 'if [ -n "$UNDER_JHBUILD" ]; then' >> ~/.bashrc
  echo '  PS1="[jhbuild$GST_VERSION] $PS1"' >> ~/.bashrc
  echo 'fi' >> ~/.bashrc
fi

if grep -q .local ~/.bashrc
then
  echo '' > /dev/null
else
  echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
  PATH=$PATH:~/.local/bin
fi

popd
git clone https://github.com/AlchemistX/GstPlayground.git
pushd GstPlayground
./jg build
