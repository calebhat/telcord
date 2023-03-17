require 'discordrb'
require 'telegram/bot'

telegramToken = ''
discordBot = Discordrb::Bot.new token: ''
discordChannel = 1057105582169014364
telegramChatId = 1777444774

#Working Discord to Telegram bot
discordBot.message(channel: discordChannel) do |event| #listens for any new message in discord
  Telegram::Bot::Client.run(telegramToken) do |bot|
    puts event.author.username
    puts event.content
    frank = event.author.username + " sends: " + event.content
    #event.respond frank #send to discord
    bot.api.send_message(chat_id: telegramChatId, text: frank) #send to telegram
   end
end




discordBot.run(true)


#test = "here we go"
#discordBot.send_message(1057105582169014364, test)


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


#    if message.text.exclude?("sends:")
#      bot.api.send_message(chat_id: message.chat.id, text: "Rubyfu, where Ruby goes eveil!")
#    end


#cd /mnt/d/railsapps/telcord