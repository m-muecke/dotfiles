alias vim="nvim"
alias vi="nvim --clean"

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme ansi"
  alias catt="bat --theme ansi"
fi

alias r="python3 -m radian"
alias ri="Rscript -e 'devtools::install()'"
alias rb="Rscript -e 'devtools::build()'"
alias rc="Rscript -e 'devtools::check()'"
alias rd="Rscript -e 'devtools::document()'"
alias rr="Rscript -e 'devtools::build_readme()'"
alias rs="Rscript -e 'styler::style_pkg()'"
