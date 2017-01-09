#!/usr/bin/env ruby
# start_bot.rb
# 09.12.2016

require 'rubygems'
require 'open-uri'
require 'iconv'
require 'uri'
require 'net/http'
require 'nokogiri'
require 'telegram/bot'

URL = 'http://trialeset.ru/'
CSS_KEYS_PAGE = 'table.table-main tr'

token = 'write your telegram token here'
get_all_commands = "\/start, \/keys, \/stop"

# read keys from file
def read_keys
  keys = File.open("nod32keysfile.txt", "r").read
  fkeys = keys.each_line { |line| }
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/help'
      bot.api.sendMessage(chat_id: message.chat.id, text: (get_all_commands) )
    when '/start'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
      bot.api.sendMessage(chat_id: message.chat.id, text: "This Bot get Trial Nod32 Keys. /help")
    when '/stop'
      bot.api.sendMessage(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/keys'
    read_keys
      bot.api.sendMessage(chat_id: message.chat.id, text: read_keys() )
    end
  end
end
