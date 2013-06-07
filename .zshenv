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
