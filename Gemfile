# source 'https://rubygems.org'
source 'http://ruby.taobao.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use mysql as the database for Active Record
gem 'mysql2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# 用户系统
gem 'devise', '3.0.1'
# 分页
gem 'will_paginate', '3.0.4'
# Bootstrap
gem 'bootstrap-sass', '~> 3.1.0'
gem 'will_paginate-bootstrap'

# YAML 配置信息
gem "settingslogic", "~> 2.0.9"
#
gem "cells", '~> 3.8.8'
# 表单
gem 'simple_form', "3.0.1"
# Faye Server 需要
gem 'thin', "1.5.0"
gem "private_pub"

#图片上传
gem 'carrierwave'
gem 'mini_magick'
# gem 'qiniu-rs'
gem 'carrierwave-qiniu'
#字段搜索及排序
gem "ransack" 
#tags
gem 'acts-as-taggable-on'
group :development do
  gem 'capistrano', '2.15.5'
  gem 'rvm-capistrano', require: false

end

group :development, :test do
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
  gem "selenium-webdriver"
end
gem 'whenever', :require => false
gem 'puma', '~> 2.4.0' # Use unicorn as the app server
#队列
gem 'sidekiq'

#net-ssh 2.8.0连接不上vps
gem "net-ssh", "~> 2.7.0"

# 三方平台 OAuth 验证登陆
gem "omniauth", "~> 1.0.1"
gem 'koala'
gem "omniauth-github", "~> 1.1.0"

#权限控制
gem 'cancan'
