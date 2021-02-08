class EmailUtility

    attr_accessor :sender, :recipient, :message
    
    def initialize(sender = nil, recipient = nil, message = nil)
        @sender = sender
        @recipient = recipient
        @message = message
    end
    
    def self.send_email
        # "we are sending the email"
    end

    def retrieve_email(from)
        # "we are retrieve the email"
    end
end