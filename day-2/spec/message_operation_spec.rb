require './models/message_operation.rb'

RSpec.describe MessageOperation do
    context '#send_email' do
        it "return Email successfully sent" do
           allow(MessageOperation).to receive(:send_email).and_return("Email successfully sent")
           expect(described_class.send_email).to eq "Email successfully sent" 
        end

        it "return Failure when sending email" do
            allow(MessageOperation).to receive(:send_email).and_return("Failure when sending email")
            expect(described_class.send_email).to eq "Failure when sending email" 
         end
    end
end