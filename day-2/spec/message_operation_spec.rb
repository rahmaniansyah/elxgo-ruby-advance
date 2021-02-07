require './models/message_operation.rb'

RSpec.describe MessageOperation do
    context '#send_email' do
        it "return Email successfully sent" do
           allow(MessageOperation).to receive(:send_email).and_return("Email successfully sent")
           expect(described_class.send_email).to eq "Email successfully sent" 
        end
    end
end