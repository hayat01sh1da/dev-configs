#!/bin/sh

repos=(
  9cc
  activeagent
  dd-trace-rb
  ginza-rb
  irb
  layered-design-for-ruby-on-rails-applications
  lr-parser-101
  magazine-rubyist-net
  metaprogramming-challenges-in-ruby
  mmtk-ruby
  mruby
  mrubyc
  picoruby
  polished-ruby-programming
  rails
  rbi
  rbs
  rbs-inline
  reading-metaprogramming-ruby
  rubocop
  rubocop-factory-bot
  rubocop-minitest
  rubocop-rails
  rubocop-rspec
  rubocop-rspec-rails
  ruby
  rules-ruby
  sorbet
  steep
  support-ts-tapl
  tapioca
  typeprof
)

cd ~/Home/Development/oss/

for repo in "${repos[@]}"; do
  echo "========== Cloning $repo =========="
  git clone --recurse-submodules git@github.com:hayat01sh1da/$repo.git
  echo "========== Finished Cloning $repo =========="
done

cd -

echo "||====================||"
echo "||    COMPLETED 🎉    ||"
echo "||====================||"

exit 0
