require 'discordrb'
require 'telegram/bot'

telegramToken = '6202881381:AAHQUj0LFIEWe2q60MOHwn6MYzvt0mL4C5o'
discordBot = Discordrb::Bot.new token: 'MTA4NTM2NDYxNjIwMjI4OTI2NQ.GUBSyU.VSD7a1x_N33qljLY3j8s7epfH3davCTg6a4ATg'
discordChannel = 978081418833956954
telegramChatId = 1001487636917

#Working Discord to Telegram bot
discordBot.message(channel: discordChannel) do |event| #listens for any new message in discord
  Telegram::Bot::Client.run(telegramToken) do |bot|
    #Sputs event.author.username
    #puts event.content
    frank = event.author.username + " sends: " + event.content
    #event.respond frank #send to discord
    bot.api.send_message(chat_id: telegramChatId, text: frank) #send to telegram
   end
end




discordBot.run(true)


Telegram::Bot::Client.run(telegramToken) do |bot|
  bot.listen do |message|
    if message.text.exclude?("sends:")
      #bot.api.send_message(chat_id: message.chat.id, text: "Rubyfu, where Ruby goes eveil!")
      #puts message.message_id
      #lastName = message.chat.last_name
      sendToDiscord = message.chat.first_name + " " + message.chat.last_name.to_s + "sends: " + message.text
      puts message.chat.first_name
      puts message.chat.last_name
      puts message.text

      discordBot.send_message(discordChannel, sendToDiscord)

    end
  end
end