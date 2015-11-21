export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.dotfiles/cache/antigen/antigen.zsh

# Load th oh-my-zsh's library
antigen use oh-my-zsh

# Bundles
# antigen bundle git
antigen bundle gitfast
antigen bundle git-flow
antigen bundle git-extras

antigen bundle common-aliases

antigen bundle brew
antigen bundle bundler
antigen bundle composer
antigen bundle gem
antigen bundle ruby
antigen bundle rvm
antigen bundle symfony2


# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Theme
antigen theme gianu

antigen apply
