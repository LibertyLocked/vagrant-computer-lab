#/bin/sh
apt-get update
apt-get install -y \
    git curl build-essential vim \
    apt-transport-https ca-certificates \
    software-properties-common \
    gnupg2 \
    python-pip \
    xorg xauth openbox libasound2 \
    openjdk-8-jre \
    openvpn

# install go
echo Installing go ...
curl -fsSL https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz | tar xz -C /usr/local
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile

# install vscode
echo Installing vscode ...
VSCODE_DEB="$(mktemp)" &&
wget --quiet -O "$VSCODE_DEB" 'https://go.microsoft.com/fwlink/?LinkID=760868' &&
dpkg -i "$VSCODE_DEB"
rm -f "$VSCODE_DEB"
apt-get install -y -f

# install node
curl -fsSL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs
# update npm
echo Updating npm ...
npm i -g --silent npm > /dev/null

# install docker
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install -y docker-ce

echo "bootstrap-0 is done"
