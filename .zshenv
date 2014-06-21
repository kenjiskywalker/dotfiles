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
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin/
PATH=$HOME:/usr/sbin:/usr/local/Cellar/imagemagick/6.6.4-5/bin:/opt/local/bin:/opt/depot_tools:/Developer/usr/bin:/bin/go_appengine
PATH=$PATH:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/local/sbin:/usr/local/share/python3:/usr/local/etc:/usr/local/share/npm/bin:$HOME/bin
export PATH
