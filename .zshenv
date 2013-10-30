#=============================
# rbenv
#=============================
if [ -d ${HOME}/.rbenv  ] ; then
    PATH=${HOME}/.rbenv/bin:${PATH}
    export PATH
    eval "$(rbenv init -)"
fi

# plenv
if [ -d ${HOME}/.plenv  ] ; then
    PATH=${HOME}/.plenv/bin/:${HOME}/.plenv/shims:${PATH}
    export PATH
    eval "$(plenv init -)"
fi

export RSENSE_HOME="${HOME}/.vim/bundle/rsense-0.3"

### golang
export GOROOT=$HOME/go
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
