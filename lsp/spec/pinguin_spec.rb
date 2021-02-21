require './lib/flightless_bird/pinguin.rb'

describe Pinguin do 
   it "can sound" do
      pinguin = Pinguin.new
      expect(pinguin.sound).to eq("wack")
   end

   it "won't fly" do
      pinguin = Pinguin.new
      expect(pinguin.fly).to eq("I can't fly")
   end
end
