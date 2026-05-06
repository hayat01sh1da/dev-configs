# Ubuntu Version
alias uver="lsb_release -a"

# IP Adress
alias ip="cat /etc/resolv.conf | grep nameserver | awk '{print $2}'"

# bash_profile
alias cbshp="cat ~/dev-scripts/.bash/.bash_profile"
alias vbshp="vim ~/dev-scripts/.bash/.bash_profile"
alias rbshp="cp ~/dev-scripts/.bash/.bash_profile ~/"
alias sbshp="source ~/.bash_profile"

# bashrc
alias cbshr="cat ~/dev-scripts/.bash/.bashrc"
alias vbshr="vim ~/dev-scripts/.bash/.bashrc"
alias rbshr="cp ~/dev-scripts/.bash/.bashrc ~/"

# Package Update
alias aist="sudo apt install -y"
alias aprg="sudo apt remove --purge"
alias aarm="sudo apt auto-remove"
alias aud="sudo apt update && sudo apt full-upgrade -y && sudo apt auto-remove"

# Mount Volume
alias dmnt="sudo mount -t drvfs"
alias dumnt="sudo umount -t drvfs"

# Change Directory
alias cdc="cd /mnt/c"
alias cddv="cd ~/dev-scripts/"
alias cdd="cd ~/Documents/development"
alias cdo="cd ~/Documents/oss"

# Open Directory
alias open="cmd.exe /c start"

# Copy to Clipboard
alias clp='clip.exe'

# Grep filename
alias fgr="find | grep"

# Empty Directories
alias lsed="cd / && find . -type d -empty -print"
alias rmed="cd / && sudo find . -type d -empty -delete"

# desktop.ini
alias lsd="cd / && sudo find . -name desktop.ini -type f -print"
alias rmd="cd / && sudo find . -name desktop.ini -type f -delete"

# __pycache__
alias lsp="cd / && sudo find . -name __pycache__ -type d -print"
alias rmp="cd / && sudo find . -name __pycache__ -type d -print | xargs rm -rf"

# Temporary Files
alias lst="cd / && sudo find . -name 'Temp' -o -name 'Tmp' -o -name 'tmp' -type f -print"
alias rmt="cd / && sudo find . -name 'Temp' -o -name 'Tmp' -o -name 'tmp' -type f -delete"

# File Cleaner
alias fcln="ruby ~/Documents/development/file-cleaners/ruby/main.rb"

# File Extension Converter
alias fec="ruby ~/Documents/development/file-extension-converters/ruby/main.rb"

# iTunes File Delimiter Replacer
alias fdr="ruby ~/Documents/development/itunes-file-delimiter-replacers/ruby/main.rb"

# JSON Data Sorting
alias jss="ruby ~/Documents/development/json-data-sorters/ruby/main.rb"

# Webdriver
alias dlwd="
  wget https://storage.googleapis.com/chrome-for-testing-public/148.0.7778.97/linux64/chromedriver-linux64.zip -P ~/Documents/development/web-scrapers/webdrivers &&
    cd ~/Documents/development/web-scrapers/webdrivers &&
    unzip chromedriver-linux64.zip &&
    mv chromedriver-linux64/chromedriver chromedriver &&
    rm -rf chromedriver-linux64* &&
    cd ~/Documents/development/web-scrapers
"

# Git
if [ -d .git/ ]; then
  default_branch=$(git rev-parse --abbrev-ref origin/HEAD | cut -f2- -d/)
  default_remote_branch=$(git rev-parse --abbrev-ref origin/HEAD)
fi

alias gini="git init"
alias gcf="git config"
alias gcfl="git config --local"
alias gcfg="git config --global"
alias gcflls="git config --list --local"
alias gcfgls="git config --global --list"
alias gcfsys="git config --system"
alias gr="git remote"
alias grad="git remote add"
alias grrm="git remote remove"
alias grrn="git remote rename"
alias grurl="git remote url"
alias grstu="git remote set-head upstream --auto"
alias gref="git rev-parse --abbrev-ref HEAD"
alias grefo="git rev-parse --abbrev-ref origin/HEAD"
alias grefu="git rev-parse --abbrev-ref upstream/HEAD"
alias gcln="git clone"
alias gclns="git clone --recurse-submodules"
alias gft="git fetch"
alias gpl="git pull"
alias gbr="git branch"
alias gbrc="git branch --show-current"
alias gbrr="git branch -r"
alias gbrd="git branch -D"
alias gbrrd="git branch -rD"
alias gbrds="git branch | grep hayat01sh1da | xargs git branch -D"
alias gbrrds="git branch -r | grep hayat01sh1da | xargs git branch -rD"
alias gbrda="git branch | sed s/^[[:space:]]*// | grep -Ev $default_branch | xargs -n1 git branch -D"
alias gbrrda="git branch -r | sed s/^[[:space:]]*// | grep -v ^origin/HEAD | grep -Ev $default_remote_branch | xargs -n1 git branch -rD"
alias gsw="git switch"
alias gswc="git switch -c"
alias gdf="git diff"
alias gst="git status"
alias gad="git add"
alias gcm="git commit"
alias gcma="git commit --amend"
alias grv="git revert"
alias gchp="git cherry-pick"
alias gsts="git stash"
alias grss="git reset --soft"
alias grsh="git reset --hard"
alias glg="git log"
alias glgo="git log --oneline"
alias grst="git restore"
alias grsts="git restore --staged"
alias gps="git push origin"
alias gmrg="git merge"
alias grb="git rebase"
alias grbi="git rebase -i"
alias grbc="git rebase --continue"
alias gig="git update-index --assume-unchanged"
alias guig="git update-index --no-assume-unchanged"
alias gigls="git ls-files -v"
alias gsad="git submodule add"
alias gsst="git submodule status"
alias gsud="git submodule update --remote --merge"
alias gspl="git pull --recurse-submodules"
alias gsaud="git config --global submodule.recurse true"
alias b2pc="git branch --show-current | xargs ruby ~/Documents/development/pr-title-printers/ruby/main.rb"
alias b2p="ruby ~/Documents/development/pr-title-printers/ruby/main.rb"

# Repository Flushing and Update
alias flsh="bash ~/dev-scripts/scripts/flush.sh"
alias setup="bash ~/dev-scripts/scripts/setup.sh"
alias rflshd="cp ~/dev-scripts/scripts/flush_and_update_personal_repos.sh ~/Documents/development/"
alias rflsho="cp ~/dev-scripts/scripts/flush_and_update_oss_repos.sh ~/Documents/oss/"
alias ruda="
  cd ~/Documents/development && bash flush_and_update_personal_repos.sh &&
  cd ~/Documents/oss && bash flush_and_update_oss_repos.sh &&
  cd ~/
"

# Gem
alias gist="gem install"
alias gistl="gem install --local"
alias guist="gem uninstall"
alias gprg="gem uninstall -I -a -x --user-install --force"
alias gud="gem update"
alias gcup="gem cleanup"

# Rubocop
alias rcp="rubocop"
alias rcpa="rubocop -a"
alias rcpalg="rubocop -a > rubocop.log"
alias rcpallg="rubocop -A > rubocop.log"
alias rcpal="rubocop -A"
alias rcptd="rubocop --auto-gen-config"
alias rcprtd="rubocop --regenerate-todo"

# RBS, RBS-Inline and Steep
alias rbscini="rbs collection init"
alias rbscist="rbs collection install"
alias rbsi="rbs-inline"
alias rbsiout="rbs-inline --output sig/generated/ ."
alias stch="steep check"
alias stchlg="steep check > steep.log"

# Bundle
alias bini="bundle init"
alias bist="bundle install"
alias bud="bundle update --all"
alias blck="bundle lock --add-checksums"
alias bexe="bundle exec"

# Rails
alias rt="bin/rails -T"
alias rc="bin/rails c"
alias rrt="bin/rails routes"
alias rsup="bin/setup --skip-server"
alias rdsup="bin/rails db:setup"
alias rdc="bin/rails db:create"
alias rdm="bin/rails db:migrate"
alias rdmr="bin/rails db:migrate:reset"
alias rds="bin/rails db:seed"
alias rdr="bin/rails db:drop"
alias rtst="bin/rails test"
alias rcrde="bin/rails credentials:edit"
alias raud="bin/rails app:update"

# Docker
## Docker itself
alias dver="docker -v"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dimg="docker images"
alias dprn="docker system prune"
alias drmi="docker rmi"
alias dvls="docker volume ls"
alias dvrm="docker volume rm"
alias dvprn="docker volume prune"

## docker-compose
alias dbld="docker-compose build"
alias dup="docker-compose up"
alias dlgs="docker-compose logs -f"
alias drst="docker-compose restart"
alias dstp="docker-compose stop"
alias ddwn="docker-compose down"
alias dexe="docker-compose exec"
alias dprg="docker-compose down --rmi all -v"

## docker-compose app
alias dbist="docker-compose exec app bundle install"
alias dbud="docker-compose exec -e BUNDLE_FROZEN=false app bundle update --all"
alias drbsh="docker-compose exec app bash"

## docker-compose DB
alias ddb="docker-compose exec db mysql -u root"

## Rails
alias drt="docker-compose exec app bin/rails -T"
alias drc="docker-compose exec app bin/rails c"
alias drrt="docker-compose exec app bin/rails routes"
alias drsup="docker-compose exec app bin/setup --skip-server"
alias drdsup="docker-compose exec app bin/rails db:setup"
alias drdc="docker-compose exec app bin/rails db:create"
alias drdm="docker-compose exec app bin/rails db:migrate"
alias drdmr="docker-compose exec app bin/rails db:migrate:reset"
alias drds="docker-compose exec app bin/rails db:seed"
alias drdr="docker-compose exec app bin/rails db:drop"
alias drtst="docker-compose exec app bin/rails test"
alias drcrde="docker-compose exec app bin/rails credentials:edit"
alias draud="docker-compose exec app bin/rails app:update"

## RSpec
alias drsp="docker-compose exec app bundle exec rspec"

## Rubocop
alias drcp="docker-compose exec app bundle exec rubocop"
alias drcpa="docker-compose exec app bundle exec rubocop -a"
alias drcpalg="docker-compose exec app bundle exec rubocop -a > rubocop.log"
alias drcpal="docker-compose exec app bundle exec rubocop -A"
alias drcpallg="docker-compose exec app bundle exec rubocop -A > rubocop.log"
alias drcptd="docker-compose exec app bundle exec rubocop --auto-gen-config"
alias drcprtd="docker-compose exec app bundle exec rubocop --regenerate-todo"

## RBS, RBS-Inline and Steep
alias drbscini="docker-compose exec app bundle exec rbs collection init"
alias drbscist="docker-compose exec app bundle exec rbs collection install"
alias drbsi="docker-compose exec app bundle exec rbs-inline"
alias drbsiout="docker-compose exec app bundle exec rbs-inline --output sig/generated/ ."
alias dstch="docker-compose exec app bundle exec steep check"
alias dstchlg="docker-compose exec app bundle exec steep check > steep.log"

# PNPM
alias dpnist="docker-compose exec app pnpm install"
alias dpnud="docker-compose exec app pnpm update"

# pip install
alias pist="pip install -y"
alias pistr="pip install -r requirements.txt"
alias puist="pip uninstall -y"
alias puistr="pip uninstall -y -r requirements.lock"
alias pfrzlk="pip freeze > requirements.lock"
alias ptst="pytest"

# Jupyter notebook
alias jn="jupyter notebook"

# rbenv
alias rbsup="git clone git@github.com:rbenv/rbenv.git ~/.rbenv && git clone git@github.com:rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build"
alias rbist="rbenv install"
alias rbistls="rbenv install --list"
alias rbuist="rbenv uninstall"
alias rbvers="rbenv versions"
alias rbistl="rbenv local"
alias rbistg="rbenv global"

# pyenv
alias pysup="git clone git@github.com:pyenv/pyenv.git ~/.pyenv && "$(pyenv root)"/plugins/python-build/install.sh"
alias pyist="pyenv install"
alias pyistls="pyenv install --list"
alias pyuist="pyenv uninstall"
alias pyvers="pyenv versions"
alias pyistl="pyenv local"
alias pyistg="pyenv global"

# ndenv
alias ndsup="git clone git@github.com:riywo/ndenv.git ~/.ndenv && git clone git@github.com:riywo/node-build.git "$(ndenv root)"/plugins/node-build"
alias ndist="ndenv install"
alias ndistls="ndenv install --list"
alias nduist="ndenv uninstall"
alias ndvers="ndenv versions"
alias ndistl="ndenv local"
alias ndistg="ndenv global"

# NPM
alias nist="npm install"
alias nud="npm update"

# PNPM
alias pnist="pnpm install"
alias pnud="pnpm update"
