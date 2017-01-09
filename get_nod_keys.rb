#!/usr/bin/env ruby
# get_keys.rb
# 09.12.2016

require 'rubygems'
require 'open-uri'
require 'iconv'
require 'time'
require 'uri'
require 'net/http'
require 'nokogiri'

URL = 'http://trialeset.ru/'
CSS_KEYS_PAGE = 'table.table-main tr'

# get keys from site
def get_keys
  mykeys = File.open("nod32keysfile.txt", "w")
  body = Nokogiri::HTML(open(URL))
  body.css(CSS_KEYS_PAGE).each do |ad| 

    login = ad.css('td')[0]
    login ? login = login.text.gsub(/Имя/, '').gsub(/пользователя/, '').gsub(/[\r\n]+/, '').gsub('EAV 4-8 версии:', "\nEAV 4-8 версии:").gsub('ESET Smart Security 9 и 10 версии:', "\nESET Smart Security 9 и 10 версии:").gsub('ESET NOD32 Antivirus 9 и 10 версии:', "\nESET NOD32 Antivirus 9 и 10 версии:").gsub('NOD32 Smart Security Premium 10:', "\nNOD32 Smart Security Premium 10:") : ''
  
    pass = ad.css('td')[1]
    pass ? pass = pass.text.gsub(/Пароль/, '').gsub(/" "/, '') : ''
   
    file = File.open("nod32keysfile.txt", "ab")  do |file|

      if !login.nil?  && login.size>1 
        mlogin = "#{login}"
        
        if pass == nil
          alllogin = mlogin
          # puts alllogin
          file.puts alllogin
        else
          allloginpass = "#{mlogin} - #{pass}"
          # puts allloginpass
          file.puts allloginpass
        end
      end
    end
  end
  file = File.open("nod32keysfile.txt", "ab")  do |file0|
    time = Time.now.strftime("%d/%m/%Y %H:%M")
    file0.puts "\nUpdated at: "+time
  end
end

p get_keys
