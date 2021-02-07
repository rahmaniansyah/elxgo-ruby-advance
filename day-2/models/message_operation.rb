require './models/email_utility.rb'

class MessageOperation

    def initialize
        @sender = sender
        @recipient = recipient
        @message = message
    end
    
    def self.send_email
        response = EmailUtility.send_email
        if response
            "Email successfully sent"
        else
            "Failure when sending email"
        end
    end

    # def retrieve_email(from)
    #     email_utility = EmailUtility.new
    #     response = email_utility.retrieve_email("aku@aku.aku")
    #     response = ["dia@dia.dia","kamu@kamu.kamu"]
    # end
    
end