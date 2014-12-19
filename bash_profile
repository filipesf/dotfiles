export PATH="/usr/local/bin:$PATH"
export NODE_ENV='development'

#YouTube Downloader
alias yt='youtube-dl -f mp4'

alias subl='sublime'
alias sketch='rm Library/Application\ Support/com.bohemiancoding.sketch3/.sketch3'

# Shorthand to Sass compiling
alias sasswatch='sass --watch assets/scss:assets/css --sourcemap=none --no-cache'
alias sassupdate='sass --update assets/scss:assets/css --sourcemap=none --no-cache'

# Compile Style Guides of the project
alias lsg='livingstyleguide compile assets/scss/styleguide.lsg styleguide.html'

# FF Starter Kit
alias ff-start='git clone https://github.com/filipesf/ff-start.git && cd ff-start && rm -rf .git'

# CSS Architecture Generator
alias smacss='mkdir assets && mkdir assets/scss && mkdir assets/scss/core && touch assets/scss/core/_global.scss && touch assets/scss/core/_functions.scss && touch assets/scss/core/_mixins.scss && touch assets/scss/core/_index.scss && mkdir assets/scss/base && touch assets/scss/base/_normalize.scss && touch assets/scss/base/_base.scss && touch assets/scss/base/_index.scss && mkdir assets/scss/layouts && touch assets/scss/layouts/_header.scss && touch assets/scss/layouts/_navigation.scss && touch assets/scss/layouts/_footer.scss && touch assets/scss/layouts/_index.scss && mkdir assets/scss/modules/ && touch assets/scss/modules/_buttons.scss && touch assets/scss/modules/_index.scss && mkdir assets/scss/states && touch assets/scss/states/_states.scss && touch assets/scss/states/_helpers.scss && touch assets/scss/states/_index.scss && touch assets/scss/main.scss && mkdir assets/css && touch Gemfile && touch config.rb && touch README.md && touch index.html'

# Remove .DS_Store
alias rmdstore='find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch'

# Enable terminal at Ministry of Health
alias msproxy='export HTTP_PROXY=http://proxy:80 && export HTTPS_PROXY=http://proxy:80'
alias msclean='export http_proxy="" && export https_proxy=""'

# Custom Terminal layout
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh
export PS1="\[\033[$txtred\u \[\033[00min \[\033[$txtgrn\w \[$txtblu\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]$ "
export SUDO_PS1="\[$bakred\]\u\[$txtrst\] \W\$ "

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# ###################### #
# Black   = [\e[0;90m'\] #
# Red     = [\e[0;91m'\] #
# Green   = [\e[0;92m'\] #
# Yellow  = [\e[0;93m'\] #
# Blue    = [\e[0;94m'\] #
# Purple  = [\e[0;95m'\] #
# Cyan    = [\e[0;96m'\] #
# White   = [\e[0;97m'\] #
# ###################### #

