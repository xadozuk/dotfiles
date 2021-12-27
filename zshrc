source ~/.dotfiles/cache/antigen/antigen.zsh

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

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
antigen bundle docker
antigen bundle gem
antigen bundle ruby
antigen bundle symfony2

antigen bundle asdf

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Theme
antigen theme gianu

#Auto-completion
fpath=(/usr/local/share/zsh-completions "$(brew --prefix)/share/zsh/site-functions" $fpath)

antigen apply

[ -s "/Users/xadozuk/.dnx/dnvm/dnvm.sh" ] && . "/Users/xadozuk/.dnx/dnvm/dnvm.sh" # Load dnvm
