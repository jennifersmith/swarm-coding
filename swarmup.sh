#!/bin/sh

# Bootstrap a set of swarm-coding dotfiles.

set -e

if [ "$USER" != "swarm" ]; then
    echo "$ Create a swarm user and run this script as that user."
    echo "(on OSX you will probably have to creat user manually!"
    echo "  sudo adduser swarm --gecos \"\" # set password to swarm"
    echo "  sudo -u swarm -i"
    echo "  curl -L http://git.io/wDeHNw > swarmup.sh"
    echo "  sh swarmup.sh"
    exit 1
fi

# Add swarm pubkey
mkdir -p ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDtC2F1cul9vGhNNH+E1juF2YdXVJ6as8aSf/djFA1sI2sYbIKM0XDjDIAEKoWAl/dBjPfGs/CppntrzOLZfDVWATINL0RTgSFw/SsfMz9LyeLokKh0jcmr1Bnwn85U10/zE9XngKlEbHcNZ1PE5cZlqLPq0TnELgbOcxIrD5A/01uuFBQlU1vQlkytyjbTkW8Y+ZhAzg133pRAtB+Jzs9kZF6huGVReiDp2BlNoJtC4LCME+J2RfTWvUWc5NtRxBRkZNtPf32i5xPMJZIwtSRO3RbCPHxSGCz5xARTwg8iAfoW6HgeVDPtxc8RiKxoctSmcC78jX546sgLjG37ZwsV tworker@swarm" >> ~/.ssh/authorized_keys

dotfiles_raw=https://raw.github.com/jennifersmith/swarm-coding/master/dotfiles/

if type -p curl >/dev/null 2>&1; then
    HTTP_CLIENT="curl -f -L -o"
else
    HTTP_CLIENT="wget -O"
fi

mkdir -p ~/.emacs.d
$HTTP_CLIENT ~/.emacs.d/init.el $dotfiles_raw/.emacs.d/init-lite.el

files=".bashrc .bash_aliases .profile .tmux.conf"

cd ~
for f in $files; do
    $HTTP_CLIENT $f $dotfiles_raw/$f
done

mkdir -p ~/bin
$HTTP_CLIENT ~/bin/lein https://raw.github.com/technomancy/leiningen/preview/bin/lein
chmod 755 ~/bin/lein

git config --global user.name "TW Swarm Coders"
git config --global user.email "NOTAGOODEMAIL@thoughtworks.com"


if [ $(emacs --version) != "swarm" ]; then
    echo "Install Emacs 24!"
    exit 1
fi

# Elisp packages
emacs --batch -l .emacs.d/init.el -f kill-emacs

echo "export PATH=\$HOME/bin:\$PATH" > ~/.profile
echo "if [ \"\$SSH_CLIENT\" != \"\" ] ; then" >> ~/.profile
echo "  echo \"Want to join the swarm coding session? Just run \\\"TERM=xterm-256color tmux attach\\\"!\"" >> ~/.profile
echo "fi" >> .profile

echo "\nSweet; launch \"TERM=xterm-256color tmux\""
echo "... and you'll be ready to host a swarm coding session."
echo "\nHave people log in as $USER@$(hostname).local using the swarm keypair"
echo "available at http://git.io/twswarmup_rsa."
