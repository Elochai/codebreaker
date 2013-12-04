require 'spec_helper'

module Codebreaker
	describe Guess do 
		context "validation" do 
			let(:valid_guess) {Guess.new("1234")}
			let(:invalid_guess) {Guess.new("12348")}

			it "should validate correct data and return 'true'" do
				expect(valid_guess).to be_valid
			end
			it "should validate wrong data and return 'false'" do
				expect(invalid_guess).to_not be_valid
			end
		end
	end
end