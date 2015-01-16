export PATH="/usr/local/bin:$PATH"
export PATH="/opt/subversion/bin:$PATH"
export NODE_ENV="development"
export NODE_PATH="/usr/local/lib/node_modules:$PATH"

# YouTube Downloader
alias yt='youtube-dl -f mp4'

# Sublime shorthand
alias subl='sublime'

# Sketch free forever
alias sketch='rm Library/Application\ Support/com.bohemiancoding.sketch3/.sketch3'

# Shorthand to Sass compiling
alias sasswatch='sass --watch --sourcemap=none --no-cache'
alias sassupdate='sass --update --sourcemap=none --no-cache'

# Compile Style Guides of the project
alias lsg='livingstyleguide compile assets/scss/styleguide.lsg styleguide.html'

# Starter Kit
alias ff-start='git clone https://github.com/filipesf/ff-start.git && cd ff-start && rm -rf .git'

# Sass Architecture Generator
alias ff-sass="mkdir settings;cd settings;touch _variables.sass;touch _colors.sass;touch _functions.sass;touch _mixins.sass;cd ../;mkdir base;cd base;touch _normalize.sass;touch _base.sass;touch _typography.sass;cd ../;mkdir structures;cd structures;touch _header.sass;touch _navigation.sass;touch _sidebar.sass;touch _footer.sass;touch _grid.sass;cd ../;mkdir objects;cd objects;touch _buttons.sass;touch _media.sass;cd ../;mkdir components;cd components;touch _buttons.sass;touch _media.sass;cd ../;mkdir replacements;cd replacements;touch _states.sass;touch _helpers.sass;;cd ../;touch main.sass;"
alias ff-scss="mkdir settings;cd settings;touch _variables.scss;touch _colors.scss;touch _functions.scss;touch _mixins.scss;cd ../;mkdir base;cd base;touch _normalize.scss;touch _base.scss;touch _typography.scss;cd ../;mkdir structures;cd structures;touch _header.scss;touch _navigation.scss;touch _sidebar.scss;touch _footer.scss;touch _grid.scss;cd ../;mkdir objects;cd objects;touch _buttons.scss;touch _media.scss;cd ../;mkdir components;cd components;touch _buttons.scss;touch _media.scss;cd ../;mkdir replacements;cd replacements;touch _states.scss;touch _helpers.scss;cd ../;touch main.scss;"

# Remove .DS_Store
alias rmdstore='find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch'

# Enable terminal at Ministry of Health
alias msproxy='export HTTP_PROXY=http://proxy:80 && export HTTPS_PROXY=http://proxy:80'
alias msclean='export http_proxy="" && export https_proxy=""'

# Git Aware Prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

# Custom Terminal layout
export PS1="\[\033[$txtred\u \[$txtrst\]in \[\033[$txtgrn\W \[$txtrst\]\$git_branch\$git_dirty\[$txtrst\]$ "
export SUDO_PS1="\[$bakred\]\u\[$txtrst\] \W\$ "

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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

