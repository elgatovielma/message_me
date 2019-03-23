class MessagesController < ApplicationController

    before_action(:require_user)

    def create
        # We associate the user whose session is logged in 
        # with the message generated
        message = current_user.messages.build(message_params)
        if message.save()
            # We broadcast the message through the channel
            # the second argument will be recived by recieved: data in the coffee file
            # We send a hash
            ActionCable.server.broadcast("chatroom_channel", 
                                        mod_message: message_render(message))
        end
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end

    def message_render(message)
        # we send our mesage to our _message partial
        # and then we render our message
        render(partial: 'message', locals: {message: message} )
    end

end