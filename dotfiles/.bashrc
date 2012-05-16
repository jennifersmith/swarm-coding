# .bashrc
# put this here to ensure linking to the HEAD brew installed emacs -
# you will have to have installed this already

export PATH="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/:$PATH"

# prompt coloring
# see http://attachr.com/9288 for full-fledged craziness
if [ `/usr/bin/whoami` = "root" ] ; then
  # root has a red prompt
  export PS1="\[\033[1;31m\]\u@\h \w \$ \[\033[0m\]"
elif [ `hostname` = "puyo" -o `hostname` = "enigma" -o `hostname` = "dynabook" ] ; then
  # the hosts I use on a daily basis have blue
  export PS1="\[\033[1;36m\]\u@\h \w \$ \[\033[0m\]"
elif [ `hostname` == domU* -o `hostname` = "lucid" -o `hostname` = "vagrant" ]; then
  # green on VMs (EC2, vbox, etc)
  export PS1="\[\033[1;32m\]\u@\h \w \$ \[\033[0m\]"
else
  # purple for unknown hosts
  export PS1="\[\033[1;35m\]\u@\h \w \$ \[\033[0m\]"
fi

function fix-agent {
  SOCKETS=`find /tmp/ -uid $UID -path \*ssh\* -type s 2> /dev/null`
  export SSH_AUTH_SOCK=$(ls --color=never -t1 $SOCKETS | head -1)
  ssh-add -l
}

if [ -f $HOME/bin/tat.sh ]; then
  source $HOME/bin/tat.sh # tmux completion
fi

# Source from elsewhere
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f $HOME/.bash_aliases ]; then
  . $HOME/.bash_aliases
fi

if [ -f $HOME/src/leiningen/bash_completion.bash ]; then
  . $HOME/src/leiningen/bash_completion.bash
fi

if [ -f /etc/bash_completion.d/git ]; then
  . /etc/bash_completion.d/git
fi
