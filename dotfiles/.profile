if [ -r /etc/profile.d/nix.sh ] ; then
    source /etc/profile.d/nix.sh
elif [ -r /usr/local/etc/profile.d/nix.sh ] ; then
    source /usr/local/etc/profile.d/nix.sh
fi

export PATH=$HOME/bin:$PATH
export PATH=$HOME/.lein/bin:$PATH
export PATH=$HOME/.gem/ruby/1.9.1/bin:/var/lib/gems/1.9.1/bin:$PATH
export PATH=/usr/lib/postgresql/8.4/bin:$PATH
export CDPATH=.:$HOME/src

# plz don't make me sudo
export GEM_HOME=$HOME/.gem/ruby/1.9.1

export EDITOR="emacsclient"

alias emacs='/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw'
