require 'discordrb'

bot = Discordrb::Bot.new token: 'MTA4NTM2NDYxNjIwMjI4OTI2NQ.GcYLUW.CkxJ6bwaIupVDy17wvg1fIp1RkFfkC9ow0YN_A'

bot.message(channel: '1057105582169014364') do |event|
  puts event.author.username
  puts event.content
  frank = event.author.username + " sends: " + event.content
  event.respond frank
end


bot.run(true)
