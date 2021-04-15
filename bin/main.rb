require 'telegram/bot'
require 'json'
require_relative '../lib/assistant'

token = '1778305517:AAGu-u69L4AW8IpA4uDJzZEuul1Qjc5xsOk'
deutsch_ass = Assistant.new

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hallo, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Tschüss, #{message.from.first_name}")
    when '/learn'
      info, type = deutsch_ass.information
      bot.api.send_message(chat_id: message.chat.id, text: "#{type} :: #{info}")
    when '/translate'
      bot.api.send_message(chat_id: message.chat.id, text: 'please enter the word you want to translate')
      bot.listen do |inner_message|
        case inner_message.text
        when 'break' || 'Break'
          meaning = deutsch_ass.translate(inner_message)
          bot.api.send_message(chat_id: message.chat.id,
                               text: "meaning of break : #{meaning}, really want to break use /break")
        when '/break'
          break
        else
          bot.api.send_message(chat_id: message.chat.id, text: deutsch_ass.translate(inner_message))
        end
      end
    else
      bot.api.send_message(chat_id: message.chat.id,
                           text: 'please choose from /start , /stop , /translate ,or /learn')
    end
  end
end
