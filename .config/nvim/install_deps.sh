#!/usr/bin/env bash

if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
	VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	OS=$(lsb_release -si)
	VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	OS=$DISTRIB_ID
	VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	OS=Debian
	VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
	# Older SuSE/etc.
	OS=SuSe
elif [ -f /etc/redhat-release ]; then
	# Older Red Hat, CentOS, etc.
	OS=RedHat
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	OS=$(uname -s)
	VER=$(uname -r)
fi

# install vim-plug
if [ ! -d ~/.local/share/nvim/site/autoload/ ]; then
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim || exit 1
fi

case "$OS" in
	"Debian GNU/Linux")
		sudo apt-get install -y build-essential clang-format python-autopep8 flake8 pylint pyflakes bandit mypy prospector pycodestyle pydocstyle pyflakes pylama pylint vulture lua-check
		sudo -u $USER pip3 install --user 'python-language-server[all]' 'pyre-check' || exit 1
		sudo -u $USER pip3 install --user 'neovim' || exit 1
		npm install -g js-beautify || exit 1
		;;
	"Fedora")
		sudo dnf install -y @development-tools
		sudo dnf install -y neovim python3-neovim nodejs python3 python-pip python3-devel ctags-etags clang python3-flake8 pylint pyflakes bandit python3-mypy python3-pycodestyle python3-pydocstyle pyflakes pylint python3-vulture || exit 1
		sudo -u $USER pip3 install --user 'python-language-server[all]' 'pyre-check' 'prospector[with_pyroma]' 'neovim' 'pylama' 'autopep8' || exit 1
		sudo npm install -g js-beautify
		sudo -u $USER go get -u github.com/stamblerre/gocode
		sudo -u $USER go get github.com/alecthomas/gometalinter
		sudo -u $USER env PATH=$PATH:$HOME/go/bin gometalinter --install
		;;
	*)
		echo "Your distribution '$OS' is not supported yet"
		;;
esac
