require 'spec_helper'

module Codebreaker
	describe Guess do 
		context "validation" do 
			let(:valid_guess) {Guess.new("1234")}
			let(:invalid_guess) {Guess.new("12348")}

			it "should validate data" do
				expect(valid_guess).to be_valid
			end

			it "should not validate wrong data" do
				expect(invalid_guess).to_not be_valid
			end
		end
	end
end