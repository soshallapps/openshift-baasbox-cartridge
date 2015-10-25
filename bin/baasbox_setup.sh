#!/bin/sh

# Baasbox 0.9.4
URL="http://www.baasbox.com/?wpdmact=process&did=NTIuaG90bGluaw=="

cd $OPENSHIFT_DATA_DIR

if [ -d "baasbox" ] && [ "`cat baasbox/URL`" == ${URL} ]; then
  echo "Baasbox already installed"
else
  echo "Installing Baasbox from ${URL}"

  if [ -d "baasbox" ]; then
    rm -rf baasbox
  fi

  wget --progress=bar -O baasbox.zip --no-check-certificate ${URL}

  mkdir baasbox
  unzip baasbox.zip &&  mv baasbox-*/* baasbox/ && rm -fr baasbox.zip baasbox-*

  echo ${URL} > baasbox/URL
  touch baasbox/.dbinit
fi
