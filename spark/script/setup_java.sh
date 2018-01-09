#!/bin/bash

# unofficial bash strict mode
set -euo pipefail
IFS=$'\n\t'

# run from any directory (no symlink allowed)
CURRENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)
cd ${CURRENT_PATH}

echo "[+] setup java"

apt-get update && apt-get upgrade -y
add-apt-repository ppa:openjdk-r/ppa -y

apt-get update && apt-get install -y \
  openjdk-8-jdk && \
  apt-get clean

java -version

# https://askubuntu.com/questions/866161/setting-path-variable-in-etc-environment-vs-profile
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" | sudo tee --append /etc/profile.d/java.sh

echo "[-] setup java"