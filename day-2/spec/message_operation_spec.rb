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

        it "return array of string when input email" do
            retieved_sender = double(email: ["dia@dia.dia","kamu@kamu.kamu"])
            puts retieved_sender.email
            allow_any_instance_of(MessageOperation).to receive(:retrieve_email).and_return(retieved_sender.email) 
            expect(described_class.new.retrieve_email("aku@aku.aku")).to eq retieved_sender.email
        end
    end
end