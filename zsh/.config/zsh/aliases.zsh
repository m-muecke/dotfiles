alias vim="nvim"
alias vi="nvim --clean"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gc="git commit"
alias gcm="git commit -m"
alias gp="git push"
alias gl="git pull"

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme ansi"
  alias catt="bat --theme ansi"
fi

alias r="python3 -m radian"
alias rinstall="Rscript -e 'pak::local_install()'"
alias rbuild="Rscript -e 'devtools::build()'"
alias rcheck="Rscript -e 'devtools::check()'"
alias rdocument="Rscript -e 'devtools::document()'"
alias rmd="Rscript -e 'devtools::build_readme()'"
alias rstyle="Rscript -e 'styler::style_pkg()'"
