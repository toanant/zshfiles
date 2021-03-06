Setup
=====

    $ git clone https://github.com/toanant/zshfiles.git ~/.zsh
    $ cd ~/.zsh
    $ git submodule init && git submodule update
    $ ln -s ~/.zsh/zshrc ~/.zshrc
    $ ln -s ~/.zsh/zshenv ~/.zshenv

For Debian based distros: -
=====

    $ sudo apt-get install zsh python-pip
    $ sudo pip install -U virtualenvwrapper
    $ chsh -s /bin/zsh
    $ echo "exec zsh" >> ~/.bashrc
    $ source ~/.bashrc

Features
========

* Fuzzy completion.
* Jump to most frequently used directory.
* Install and manage Ruby versions with ease.
* Intelligently add '/' when it sees a series of dots.
* Zprompt - a minimal configuration of zsh to run as a launcher (.zprompt), and
  a shell script (depends on xterm) to launch it (bin/zprompt).
