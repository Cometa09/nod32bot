#!/usr/bin/env bash
##!/bin/bash

export PATH="/home/alex/.rvm/gems/ruby-2.3.1/bin:/home/alex/.rvm/gems/ruby-2.3.1@global/bin:/home/alex/.rvm/rubies/ruby-2.3.1/bin:$PATH"
export GEM_HOME='/home/alex/.rvm/gems/ruby-2.3.1'
export GEM_PATH='/home/alex/.rvm/gems/ruby-2.3.1:/home/alex/.rvm/gems/ruby-2.3.1@global'
export MY_RUBY_HOME='/home/alex/.rvm/rubies/ruby-2.3.1'
#export IRBRC='/home/alex/.rvm/rubies/ruby-2.3.1/.irbrc'
unset MAGLEV_HOME
unset RBXOPT
#source /usr/local/rvm/enviroments/ruby-2.3.1

cd /var/www/nod32/
/home/alex/.rvm/rubies/ruby-2.3.1/bin/ruby /var/www/nod32/start_bot.rb
#>>/var/log/start_bot.log
