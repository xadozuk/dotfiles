export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.dotfiles/cache/antigen/antigen.zsh

# Load th oh-my-zsh's library
antigen use oh-my-zsh

# Bundles
# antigen bundle git
antigen bundle gitfast
antigen bundle brew
antigen bundle bundler
antigen bundle composer
antigen bundle gem
antigen bundle ruby
antigen bundle rvm
antigen bundle symfony2


# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# Theme
antigen theme gianu

antigen apply
