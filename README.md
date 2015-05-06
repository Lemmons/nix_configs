# nix_configs
The set of linx/osx terminal configs I like to use.

This repo depends on Vundle.vim as a submodule. The correct way to clone the repo is: `git clone --recursive git@github.com:Lemmons/nix_configs.git`.  If you have already cloned the repo, then `git submodule init; git submodule update` will get you to the correct state.

To use simply copy symlink the desired config to your home directory.
The files will need to be prefixed with `.` to work, and also might need some renaming, depending on your environment,
such as `ln -s ~/src/nix_configs/bashrc_mac ~/.profile`.

Also, there is a lot of interdependency between them, so if you want to use one part only,
you might need to do a bit of modification to that script.

You also might need to install a newer version of vim. On mac this can be done with `brew install vim --override-system-vim --HEAD`.
