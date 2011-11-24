# broadcast a message to every room the bot is in
#
# allhands [msg]

module.exports = (robot) ->
  robot.respond /(?:(allhands|broadcast)) (.+)/i, (msg) ->
    currentRoom = msg.message.user.room
    msg.send "current room is #{currentRoom}"
    for roomId in process.env.HUBOT_CAMPFIRE_ROOMS.split(",")
      do (roomId) ->
        msg.send "roomId is #{roomId}"
        msg.message.user.room = roomId
        msg.send msg.match[2] unless roomId is currentRoom
