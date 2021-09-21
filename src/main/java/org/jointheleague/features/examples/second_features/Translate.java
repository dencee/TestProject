package org.jointheleague.features.examples.second_features;


import java.util.Random;

import org.javacord.api.event.message.MessageCreateEvent;
import org.jointheleague.features.abstract_classes.Feature;
import org.jointheleague.features.help_embed.plain_old_java_objects.help_embed.HelpEmbed;

public class Translate extends Feature {

    public final String COMMAND = "!translate";

    public Translate(String channelName) {
        super(channelName);
        helpEmbed = new HelpEmbed(COMMAND, "Translate text! (usage: !translate [word]");
    }

    @Override
    public void handle(MessageCreateEvent event) {
        String messageContent = event.getMessageContent();
        if (messageContent.startsWith(COMMAND)) {
        	String outMessage = "https://translate.google.com/?hl=en&sl=auto&tl=en&text=Bonjour%2C%20je%20m%27appelle%20Joe&op=translate";
            
            event.getChannel().sendMessage(outMessage);
        }
    }

}
