require 'telegram/bot'
require '../lib/assistant'

token = '1778305517:AAGu-u69L4AW8IpA4uDJzZEuul1Qjc5xsOk'
deutsch_ass = Assistant.new

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/surprise'
      info, type = deutsch_ass.information
      bot.api.send_message(chat_id: message.chat.id, text: "#{type} :: #{info}")
    end
  end
end
