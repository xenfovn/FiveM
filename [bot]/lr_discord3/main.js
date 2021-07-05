var Discordie = require('discordie');
var config = require('./config.js');
const prefix = "/";
var client = new Discordie({
    autoReconnect  : true
});

client.connect({token: config.BotToken});
client.Dispatcher.on("GATEWAY_READY", e=>{
    console.log("Connected as : "+client.User.username);
})
client.Dispatcher.on("MESSAGE_CREATE", e=>{
    var content = e.message.content;
    console.log(config.channelId);
    if (e.message.author.bot) return;
    if (e.message.channel_id != config.channelId) return;
    if (content.indexOf(prefix) == 0){
        const args = content.slice(prefix.length).trim().split(/ +/g);
        const command = args[0]
        var playerId = parseInt(args[1]);
        var author = e.message.author.username;
        var playerName = GetPlayerName(playerId);
        switch (command){
            case 'revive':
                if (args[1] == undefined){
                    e.message.channel.sendMessage("```invalid command \n !!revive [id]```");
                    //e.message.channel.sendMessage(e.message.author.username);
                }else{
                    if (playerName == null){
                        e.message.channel.sendMessage("```Người chơi này không online```");

                    }else{
                        emit('discord:server:command', author, command, playerId);
                        e.message.channel.sendMessage(`\`\`\`Đã hồi sinh người chơi ${playerName}\`\`\``);
                    }
                }
                break;
            case 'slay':
                if (args[1] == undefined){
                    e.message.channel.sendMessage("```invalid command \n !!slay [id]```");
                }else{
                    if (playerName == null){
                        e.message.channel.sendMessage("```Người chơi này không online```");

                    }else{
                        emit('discord:server:command', author, command, playerId);
                        e.message.channel.sendMessage(`\`\`\`Đã giết người chơi ${playerName}\`\`\``);
                    }                    
                }
                break;
            case 'kick':
                if(args[1] == undefined){
                    e.message.channel.sendMessage("```invalid command \n !!kick [id]")
                }else{
                    if (playerName == null){
                        e.message.channel.sendMessage("```Người chơi này không online```");

                    }else{
                        emit('discord:server:command', author, command, playerId);
                        e.message.channel.sendMessage(`\`\`\`Đã kick người chơi ${playerName} \`\`\``);
                    }
                }
                break;
            default:
        }
    }
});

