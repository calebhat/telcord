require 'discordrb'
require 'telegram/bot'

telegramToken = ''
discordBot = Discordrb::Bot.new token: ''
#discordChannel = 978081418833956954 #Adosia General
#telegramChatId = -1001487636917 #Adosia telegram

#testing
discordChannel = 1057105582169014364
telegramChatId = -991949802


#Working Discord to Telegram bot
discordBot.message(channel: discordChannel) do |event| #listens for any new message in discord
  puts event.channel
  Telegram::Bot::Client.run(telegramToken) do |bot|
    #puts event.author.username
    if event.content.include?("discordapp.net/attachments") || event.content.include?(".com")
      toSend = event.author.username + " from Discord: " + event.content
      bot.api.send_message(chat_id: telegramChatId, text: toSend) #send to telegram
      #bot.api.send_message(chat_id: telegramChatId, text: event.content) #send to telegram
    else
      if event.content == nil || event.content == ""
        toSend = event.author.username + " sent an attachment/picture in Discord"
      else
        toSend = event.author.username + " from Discord: " + event.content
      end
      bot.api.send_message(chat_id: telegramChatId, text: toSend) #send to telegram
    end
   end
end


discordBot.run(true)


#test = "here we go"
#discordBot.send_message(1057105582169014364, test)

@started = false
Telegram::Bot::Client.run(telegramToken) do |bot|
  bot.listen do |message|
    if message.try(:text) != nil #check if API is sending correct data
      if message.text.exclude?("Discord:") #makes sure a loop doesn't happen
        
        if message.text.to_s == "/bail" && @started == true #Testing bailout if needed
          return
        else
          @started = true
        end

        sendToDiscord = message.from.first_name + " " + message.from.last_name.to_s + " from Telegram: " + message.text
        discordBot.send_message(discordChannel, sendToDiscord)
      end
    end
  
  end
end
