source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "dotenv-rails", "2.8.1", groups: [:development, :test]
gem "rails", "~> 7.0.8"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
gem "bootsnap", require: false
gem "omniauth-esa"
gem "omniauth-rails_csrf_protection", "~> 1.0.1"
gem "esa"
gem "redcarpet", "~> 3.6.0"
gem "rouge", "~> 4.1.3"

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
end
