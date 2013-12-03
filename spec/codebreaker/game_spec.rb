require 'spec_helper'

module Codebreaker
	describe Game do 
		context "initially" do
			it "should generate a code" do
				expect(subject.code).to_not be_empty
			end
			it "should generate a code with 4 numbers" do 
				expect(subject.code.size).to eq(4)
			end
			it "should generate a code with 4 random numbers in 1..6 range each" do 
				expect(subject.code).to match(/^[1-6]{4}$/)
			end
		end
		context "guess" do
			it "should recieve user's guess code" do
				expect(subject).to receive(:guess).with(anything())
				subject.guess("anything")
			end
			it "should return valid user's guess code" do
				valid_code = "1234"
				allow(subject).to receive(:guess).with(valid_code).and_return(valid_code)
				expect(subject.guess(valid_code)).to eq(valid_code) 
			end
			it "should raise error for invalid user's guess code" do
				invalid_code = "12568"
				expect {subject.guess(invalid_code)}.to raise_error
			end
		end
		context "compare" do
			before {subject.code = "1234"}
			it "should fail if no match found" do 
				subject.guess_code = "5555"
				expect(subject.compare).to eq([])
			end
			it "should mark with '-' for approximate match" do 
				subject.guess_code = "5155"
				expect(subject.compare).to eq(["-"])
			end
			it "should mark with '+' for exact match" do 
				subject.guess_code = "5255"
				expect(subject.compare).to eq(["+"])
			end
			it "should mark with both '+' and '-' for exact and approximate matches at one guess" do 
				subject.guess_code = "1525"
				expect(subject.compare).to eq(["+","-"])
			end
			it "should mark with 4 "+" for complete win" do 
				subject.guess_code = "1234"
				expect(subject.compare).to eq(["+","+","+","+"])
			end
		end
		context "hint" do
			it "should return a number from 1 to 6" do
				expect(subject.give_hint).to match(/^[1-6]$/)
			end
			it "should reveal one random number of initial code" do
				subject.code = "1234"
				expect(subject.give_hint).to match(/^[1234]$/)
			end
		end
	end
		
end