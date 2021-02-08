require './models/message_operation.rb'

RSpec.describe MessageOperation do
    context '#send_email' do
        it "[STUB]return Email successfully sent" do
           allow(MessageOperation).to receive(:send_email).and_return("Email successfully sent")
           expect(described_class.send_email).to eq "Email successfully sent" 
        end

        it "[MOCK]return Email successfully sent using stub" do
            email_utility = double
            allow(email_utility).to receive(:send_email).and_return(email_utility)
            expect(described_class.send_email).to eq "Failure when sending email" 
         end
    end

    context '.retrieve_email' do
        # it "[STUB]return array of string when input email" do
        #     allow_any_instance_of(MessageOperation).to receive(:retrieve_email).and_return(["dia@dia.dia","kamu@kamu.kamu"])
        #     expect(described_class.new().retrieve_email("aku@aku.aku")).to eq ["dia@dia.dia","kamu@kamu.kamu"]
        #  end

        it "[MOCK]return array of string when input email" do
            retieved_sender = double(email_utility: ["dia@dia.dia","kamu@kamu.kamu"])
            allow_any_instance_of(MessageOperation).to receive(:retrieve_email).and_return(retieved_sender.email_utility) 
            expect(described_class.new(retieved_sender).retrieve_email("aku@aku.aku")).to eq retieved_sender.email_utility
        end
    end
end