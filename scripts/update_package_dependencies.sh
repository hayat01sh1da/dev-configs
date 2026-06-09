#!/bin/sh

python_apps=(
  botpress-accuracy-reporters/python
  coding-tests/python
  deep-learnings
  file-cleaners/python
  file-extension-converters/python
  github-wiki-organisers/python
  itunes-file-delimiter-replacers/python
  json-data-sorters/python
  natural-language-processing
  pr-title-printers/python
  template-creators/python
  tutorials/python
  web-scrapers
)

ruby_apps=(
  botpress-accuracy-reporters/ruby
  coding-tests/ruby
  file-cleaners/ruby
  file-extension-converters/ruby
  github-wiki-organisers/ruby
  itunes-file-delimiter-replacers/ruby
  json-data-sorters/ruby
  pr-title-printers/ruby
  template-creators/ruby
)

js_apps=(
  coding-tests/javascript
  tutorials/javascript
  tutorials/reactjs
  tutorials/ruby-on-rails/perfect-ruby-on-rails
  tutorials/typescript
)

rails_apps=(
  botpress-accuracy-reporters/ruby-on-rails
  tutorials/ruby-on-rails/e-navigator
  tutorials/ruby-on-rails/perfect-ruby-on-rails
  tutorials/ruby-on-rails/restful-api
)

cd ~/Home/Development/personal/
base_dir=$(pwd)

for python_app in "${python_apps[@]}"
do
  echo "========== Updating Pip Dependencies in $python_app =========="
  cd $python_app
    pip uninstall -y -r ~/requirements.lock
    pip install -r requirements.txt --upgrade
    pip freeze > requirements.lock
  cd $base_dir
  echo "========== Finished Updating Pip Dependencies in $python_app =========="
done

for ruby_app in "${ruby_apps[@]}"
do
  echo "========== Updating Gem Dependencies in $ruby_app =========="
  cd $ruby_app
    bundler update --all
  cd $base_dir
  echo "========== Finished Updating Gem Dependencies in $ruby_app =========="
done

for js_app in "${js_apps[@]}"
do
  echo "========== Updating pnpm Package Dependencies in $js_app =========="
  cd $js_app
    rm -rf node_modules
    pnpm install
    pnpm update
  cd $base_dir
  echo "========== Finished Updating pnpm Package Dependencies in $js_app =========="
done

for rails_app in "${rails_apps[@]}"
do
  echo "========== Updating Gem Dependencies in $rails_app =========="
  cd $rails_app
    docker-compose build
    docker-compose up -d
    docker-compose exec -e BUNDLE_FROZEN=false app bundle update --all
    docker-compose exec app bundle exec rbs collection update
  cd $base_dir
  echo "========== Finished Updating Gem Dependencies in $rails_app =========="
done

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"

exit 0
