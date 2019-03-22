class MessagesController < ApplicationController

    before_action(:require_user)

    def create
        # We associate the user whose session is logged in 
        # with the message generated
        message = current_user.messages.build(message_params)
        if message.save()
            redirect_to(root_path)
        end
    end

    private

    def message_params
        params.require(:message).permit(:body)
    end

end