source ~/.dotfiles/cache/antigen/antigen.zsh

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

[ -s "/Users/xadozuk/.dnx/dnvm/dnvm.sh" ] && . "/Users/xadozuk/.dnx/dnvm/dnvm.sh" # Load dnvm

if [ -f ~/.asdf/asdf.sh ]; then
    source ~/.asdf/asdh.sh
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
antigen bundle docker
antigen bundle gem
antigen bundle ruby

antigen bundle asdf

# Syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# Theme
antigen theme gianu

#Auto-completion
fpath=(/usr/local/share/zsh-completions $fpath)

if command -v brew &> /dev/null
then
    fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

antigen apply

