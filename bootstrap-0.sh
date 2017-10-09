#/bin/sh
apt-get update
apt-get install -y \
    git curl build-essential vim-gtk \
    apt-transport-https ca-certificates \
    software-properties-common \
    xorg xauth openbox \
    openjdk-8-jre \
    openvpn

# install go
echo Installing go ...
curl -fsSL https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz | tar xz -C /usr/local
echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile

# install node
echo Installing nodejs ...
curl -fsSL https://deb.nodesource.com/setup_6.x | bash -
apt-get install -y nodejs
# update npm
echo Updating npm ...
npm i -g --silent npm > /dev/null

# install vscode
echo Installing vscode ...
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
add-apt-repository \
    "deb [arch=amd64] https://packages.microsoft.com/repos/vscode \
    stable main"
apt-get update
apt-get install -y libasound2 code

echo "bootstrap-0 is done"
