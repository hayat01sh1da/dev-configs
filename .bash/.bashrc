#!/bin/sh

# System
## Ubuntu Version
alias uver="lsb_release -a"

## IP Adress
alias ip="cat /etc/resolv.conf | grep nameserver | awk '{print $2}'"

## bash_profile
alias cbshp="cat ~/dev-configs/.bash/.bash_profile"
alias vbshp="vim ~/dev-configs/.bash/.bash_profile"
alias rbshp="cp ~/dev-configs/.bash/.bash_profile ~/"
alias sbshp="source ~/.bash_profile"

## bashrc
alias cbshr="cat ~/dev-configs/.bash/.bashrc"
alias vbshr="vim ~/dev-configs/.bash/.bashrc"
alias rbshr="cp ~/dev-configs/.bash/.bashrc ~/"

## Package Update
alias aist="sudo apt install -y"
alias aprg="sudo apt remove --purge"
alias aarm="sudo apt auto-remove"
alias aud="sudo apt update && sudo apt full-upgrade -y && sudo apt auto-remove"
alias als="sudo apt list --installed"
alias alslck="sudo apt list --installed > ~/dev-configs/lib/apt-installed-packages.lock"

## Mount Volume
alias dmnt="sudo mount -t drvfs"
alias dumnt="sudo umount -t drvfs"

## Change Directory
alias cdc="cd /mnt/c"
alias cdd="cd ~/dev-configs/"
alias cdo="cd ~/Home/Development/oss"
alias cdp="cd ~/Home/Development/personal"

## Open Directory
alias open="cmd.exe /c start"

## Copy to Clipboard
alias clp='clip.exe'

# File Handling
## Find
alias ffd="find . -type f -name"
alias dfd="find . -type d -name"

## Empty Directories
alias lsed="find . -type d -empty -print"
alias rmed="find . -type d -empty -delete"
alias rmeda="cd / && sudo find . -type d -empty -delete && cd -"

## desktop.ini
alias lsd="find . -type f -name "desktop.ini" -print"
alias rmd="find . -type f -name "desktop.ini" -prune -exec rm -rf {} +"
alias rmda="cd / && sudo find . -name desktop.ini -type f -prune -exec rm -rf {} + && cd -"

## Python Cache
alias lsp="find . -type d -regextype posix-extended -regex '.*py.*cache.*' -print"
alias rmp="find . -type d -regextype posix-extended -regex '.*py.*cache.*' -prune -exec rm -rf {} +"
alias rmpa="cd / && sudo find . -type d -regextype posix-extended -regex '.*py.*cache.*' -prune -exec rm -rf {} + && cd -"

## Temporary Files
alias lst="find . -type d -regextype posix-extended -regex '[Tt]e?mp' -print"
alias rmt="find . -type d -regextype posix-extended -regex '[Tt]e?mp' -delete"
alias rmta="cd / && sudo find . -type d -regextype posix-extended -regex '[Tt]e?mp' -delete && cd -"

# Versioning
# Git
if ! command -v git &> /dev/null; then
  default_branch=$(git rev-parse --abbrev-ref origin/HEAD | cut -f2- -d/)
  default_remote_branch=$(git rev-parse --abbrev-ref origin/HEAD)
  current_branch=$(git branch --show-current)
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
alias gprn="git prune"

## Repository Flushing and Update
alias flsh="bash ~/dev-configs/scripts/flush.sh"
alias setup="bash ~/dev-configs/scripts/setup.sh"
alias fsetup="bash ~/dev-configs/scripts/flush.sh && bash ~/dev-configs/scripts/setup.sh"
alias rclno="cp ~/dev-configs/scripts/clone_oss_repos.sh ~/Home/Development/oss/"
alias rfudo="cp ~/dev-configs/scripts/flush_and_update_oss_repos.sh ~/Home/Development/oss/"
alias rclnp="cp ~/dev-configs/scripts/clone_personal_repos.sh ~/Home/Development/personal/"
alias rfudp="cp ~/dev-configs/scripts/flush_and_update_personal_repos.sh ~/Home/Development/personal/"
alias rudpd="cp ~/dev-configs/scripts/update_package_dependencies.sh ~/Home/Development/personal/"
alias fuda="
  bash ~/dev-configs/scripts/flush_and_update_personal_repos.sh &&
  bash ~/dev-configs/scripts/flush_and_update_oss_repos.sh
"

# Lang Environment Managers
## rbenv
alias rbsup="git clone git@github.com:rbenv/rbenv.git ~/.rbenv && git clone git@github.com:rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build"
alias rbist="rbenv install"
alias rbistls="rbenv install --list"
alias rbuist="rbenv uninstall"
alias rbvers="rbenv versions"
alias rbl="rbenv local"
alias rbg="rbenv global"

## pyenv
alias pysup="git clone git@github.com:pyenv/pyenv.git ~/.pyenv && "$(pyenv root)"/plugins/python-build/install.sh"
alias pyist="pyenv install"
alias pyistls="pyenv install --list"
alias pyuist="pyenv uninstall"
alias pyvers="pyenv versions"
alias pyl="pyenv local"
alias pyg="pyenv global"

## ndenv
alias ndsup="git clone git@github.com:riywo/ndenv.git ~/.ndenv && git clone git@github.com:riywo/node-build.git "$(ndenv root)"/plugins/node-build"
alias ndist="ndenv install"
alias ndistls="ndenv install --list"
alias nduist="ndenv uninstall"
alias ndvers="ndenv versions"
alias ndl="ndenv local"
alias ndg="ndenv global"

# Package Managers
## Gem
alias gist="gem install"
alias gistl="gem install --local"
alias guist="gem uninstall"
alias gprg="gem uninstall -I -a -x --user-install --force"
alias gud="gem update"
alias gls="gem list"
alias gcup="gem cleanup"

## Bundle
alias bini="bundle init"
alias bist="bundle install"
alias bud="bundle update --all"
alias blck="bundle lock --add-checksums"
alias bexe="bundle exec"

## pip install
alias pist="pip install -y"
alias pistr="pip install -r requirements.txt"
alias puist="pip uninstall -y"
alias puistr="pip uninstall -y -r requirements.lock"
alias pfrzlck="pip freeze > requirements.lock"
alias pls="pip list"

## npm
alias nist="npm install"
alias nud="npm update"
alias nls="npm list"

## pnpm
alias pnist="pnpm install"
alias pnls="pnpm list"

# Ruby / Rails
## Rubocop
alias rcp="rubocop"
alias rcpa="rubocop -a"
alias rcpalg="rubocop -a > rubocop.log"
alias rcpal="rubocop -A"
alias rcpallg="rubocop -A > rubocop.log"
alias rcptd="rubocop --auto-gen-config"
alias rcprtd="rubocop --regenerate-todo"

## RBS, RBS-Inline and Steep
alias rbscini="rbs collection init"
alias rbscist="rbs collection install"
alias rbsi="rbs-inline"
alias rbsiout="rbs-inline --output sig/generated/ ."
alias stch="steep check"
alias stchlg="steep check > steep.log"

## Rails
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

## File Cleaner
alias fcln="cd ~/Home/Development/personal/file-cleaners/ruby/ && rake run_file_cleaner && cd -"

## File Extension Converter
alias fec="cd ~/Home/Development/personal/file-extension-converters/ruby/ && rake run_file_extension_converter && cd -"

## iTunes File Delimiter Replacer
alias fdr="cd ~/Home/Development/personal/itunes-file-delimiter-replacers/ruby/ && rake run_itunes_file_delimiter_replacer && cd -"

## JSON Data Sorting
alias jss="cd ~/Home/Development/personal/json-data-sorters/ruby/ && rake run_json_data_sorter && cd -"

## PR Title Printer
alias b2p="cd ~/Home/Development/personal/pr-title-printers/ruby/ && rake run_pr_title_printer && cd -"

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
alias dbist="docker-compose exec -e BUNDLE_FROZEN=false app bundle install"
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

# pnpm
alias dpnist="docker-compose exec app pnpm install"
alias dpnud="docker-compose exec app pnpm update"

# Python
## pytest
alias ptst="pytest"
alias aflk="autoflake8 --in-place --remove-duplicate-keys --remove-unused-variables --recursive ."
alias apep="autopep8 --in-place --aggressive --aggressive --recursive ."

# Jupyter notebook
alias jn="jupyter notebook"

# Webdriver
alias dlwd="
  wget https://storage.googleapis.com/chrome-for-testing-public/148.0.7778.167/linux64/chromedriver-linux64.zip -P ~/Home/Development/personal/web-scrapers/webdrivers &&
    cd ~/Home/Development/personal/web-scrapers/webdrivers &&
    unzip chromedriver-linux64.zip &&
    mv chromedriver-linux64/chromedriver chromedriver &&
    rm -rf chromedriver-linux64* &&
    cd -
"
