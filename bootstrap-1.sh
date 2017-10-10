#/bin/bash
mkdir -p $HOME/workspace/go
# tweaking bash profile
echo "# bootstrapped" >> ~/.profile
echo "export GOPATH=$HOME/workspace/go" >> ~/.profile
echo "export GIT_TERMINAL_PROMPT=1" >> ~/.profile

# get dynamodb
mkdir -p $HOME/dynamodb-local
echo Installing dynamodb-local ...
curl -fsSL https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz | tar xz -C ~/dynamodb-local

# install vscode extensions
exts=( \
    "bbenoist.vagrant" \
    "codezombiech.gitignore" \
    "donjayamanne.githistory" \
    "donjayamanne.python" \
    "eamodio.gitlens" \
    "EditorConfig.EditorConfig" \
    "eg2.tslint" \
    "eg2.vscode-npm-script" \
    "lukehoban.Go" \
    "msjsdiag.debugger-for-chrome" \
)
for ext in "${exts[@]}"
do
    code --install-extension $ext
done

echo "bootstrap-1 is done"
