require 'discordrb'
require 'telegram/bot'

telegramToken = ''
discordBot = Discordrb::Bot.new token: ''
discordChannel = 978081418833956954
telegramChatId = -1001487636917

#Working Discord to Telegram bot
discordBot.message(channel: discordChannel) do |event| #listens for any new message in discord
  Telegram::Bot::Client.run(telegramToken) do |bot|
    #puts event.author.username
    #puts event.content
    frank = event.author.username + " sends from Discord: " + event.content
    #event.respond frank #send to discord
    bot.api.send_message(chat_id: telegramChatId, text: frank) #send to telegram
   end
end

# adosia telegram chat group id: =1001487636917


discordBot.run(true)


#test = "here we go"
#discordBot.send_message(1057105582169014364, test)

@started = false
Telegram::Bot::Client.run(telegramToken) do |bot|
  bot.listen do |message|
    if message.text.exclude?("sends:")
      
      #if message.text.to_s == "/bail" && @started == true
      #  return
      #else
      #  @started = true
      #end

      sendToDiscord = message.from.first_name + " " + message.from.last_name.to_s + "sends from Telegram: " + message.text
      discordBot.send_message(discordChannel, sendToDiscord)
    end
  
  end
end


#    if message.text.exclude?("sends:")
#      bot.api.send_message(chat_id: message.chat.id, text: "Rubyfu, where Ruby goes eveil!")
#    end


#cd mnt/d/railsapps/test/telcord


#Now attempting to send back to discord
#@telcord_coms_bot hello
#<Telegram::Bot::Types::ChatMemberUpdated:0x00007fdb2af3f4c8>

#<Telegram::Bot::Types::Message:0x00007f8ddd6b3a88>


#for direct message
#sendToDiscord = message.chat.first_name + " " + message.chat.last_name.to_s + "sends: " + message.text