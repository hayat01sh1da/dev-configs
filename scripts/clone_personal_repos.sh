#!/bin/sh

repos=(
  botpress-accuracy-reporters
  coding-tests
  deep-learnings
  file-cleaners
  file-extension-converters
  github-wiki-organisers
  github-wiki-organisers.wiki
  itunes-file-delimiter-replacers
  json-data-sorters
  natural-language-processing
  pr-title-printers
  readme-updaters
  template-creators
  tutorials
  web-scrapers
)

cd ~/Home/Development/personal/

for repo in "${repos[@]}"
do
  echo "========== Cloning $repo =========="
  git clone --recurse-submodules git@github.com:hayat01sh1da/$repo.git
  echo "========== Finished Cloning $repo =========="
done

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"

exit 0
