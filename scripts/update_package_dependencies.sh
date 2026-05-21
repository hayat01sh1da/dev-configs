#!/bin/sh

cd ~/Home/Development/personal/

for project in $(ls -d ./*/);
do
  cd $project
  echo "========== Flushing and Updating $project =========="

  if [ $(find . -name "requirements.txt" | wc -l) -gt 0 ]; then
    cd python/
      echo "===== Updating pip Dependencies in $(pwd) ====="
      pip install -r requirements.txt --upgrade
      pip freeze > requirements.lock
      echo "===== Finished Updating pip Dependencies in $(pwd) ====="
    cd ..
  fi
  if [ $(find . -name "Gemfile" | wc -l) -gt 0 ]; then
    cd ruby/
      echo "===== Updating Gem Dependencies in $(pwd) ====="
      gem update --system
      gem install bundler
      bundle install
      bundle lock --add-checksums
      bundle update --all
      echo "===== Finished Updating Gem Dependencies in $(pwd) ====="
    cd ..
    if [ -d "ruby-on-rails" ]; then
      cd ruby-on-rails/
      app_names=$(find . -name e-navigator -o -name perfect-ruby-on-rails -o -name restful-api -type d)
      if [ $($app_names | wc -l) -gt 0 ]; then
        for app_name in $app_names;
        do
          cd $app_name
          echo "===== Updating Gem Dependencies in $(pwd) ====="
          docker-compose build
          docker-compose up -d
          docker-compose exec -e BUNDLE_FROZEN=false app bundle update --all
          docker-compose down
          echo "===== Finished Updating Gem Dependencies in $(pwd) ====="
          cd ..
        done
      else
        echo "===== Updating Gem Dependencies in $(pwd) ====="
        docker-compose build
        docker-compose up -d
        docker-compose exec -e BUNDLE_FROZEN=false app bundle update --all
        docker-compose down
        echo "===== Finished Updating Gem Dependencies in $(pwd) ====="
        cd ..
      fi
    fi
  fi
  if [ $(find . -name "package.json" | wc -l) -gt 0 ]; then
    cd javascript/
      echo "===== Updating pnpm Dependencies in $(pwd) ====="
      rm -rf node_modules/
      pnpm install --frozen-lockfile
      pnpm update
      echo "===== Finished Updating pnpm Dependencies in $(pwd) ====="
    cd ..
    if [ -d "typescript" ]; then
      cd typescript/
      echo "===== Updating pnpm Dependencies in $(pwd) ====="
        rm -rf node_modules/
        pnpm install --frozen-lockfile
        pnpm update
        echo "===== Finished Updating pnpm Dependencies in $(pwd) ====="
      cd ..
    fi
    if [ -d "ruby-on-rails/perfect-ruby-on-rails" ]; then
      cd ruby-on-rails/perfect-ruby-on-rails/
        echo "===== Updating pnpm Dependencies in $(pwd) ====="
        rm -rf node_modules/
        pnpm install --frozen-lockfile
        pnpm update
        echo "===== Finished Updating pnpm Dependencies in $(pwd) ====="
      cd ../..
    fi
    if [ -d "reactjs" ]; then
      cd reactjs/
        echo "===== Updating pnpm Dependencies in $(pwd) ====="
        rm -rf node_modules/
        pnpm install --frozen-lockfile
        pnpm update
        echo "===== Finished Updating pnpm Dependencies in $(pwd) ====="
      cd ..
    fi
  fi
done

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"
