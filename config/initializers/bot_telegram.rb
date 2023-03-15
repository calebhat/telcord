require 'telegram/bot'


token = '6202881381:AAHQUj0LFIEWe2q60MOHwn6MYzvt0mL4C5o'


#​
Telegram::Bot::Client.run(token) do |bot|
  client.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/rubyfu'
      bot.api.send_message(chat_id: message.chat.id, text: "Rubyfu, where Ruby goes eveil!")
    end
  end
end