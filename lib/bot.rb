# rubocop:disable Metrics/MethodLength

require 'telegram/bot'
require 'json'
require_relative 'assistant'
class Bot
  def initialize
    token = '1773974309:AAH8_E1FAvhNmyfDUzpInlPFlmfRSaiqjRY'
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
            when '/break'
              break
            else
              bot.api.send_message(chat_id: message.chat.id, text:
              "#{deutsch_ass.translate(inner_message)}
use /break to stop translating")
            end
          end
        else
          bot.api.send_message(chat_id: message.chat.id,
                               text: 'please choose from /start , /stop , /translate ,or /learn')
        end
      end
    end
  end
end

# rubocop:enable Metrics/MethodLength
