sudo apt update
sudo apt upgrade
sudo apt install build-essential
sudo apt install zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install fzf eza nvim
source <(fzf --zsh) \n
git clone https://github.com/LazyVim/starter ~/.config/nvim

