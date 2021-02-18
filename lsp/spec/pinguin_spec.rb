require './pinguin'

describe Pinguin do 
 it "can sound" do
  pinguin = Pinguin.new
  expect(pinguin.sound).to eq("wack")
 end
 it "won't fly" do
  pinguin = Pinguin.new
  expect{pinguin.fly}.to raise_error("I can't fly")
 end
end
