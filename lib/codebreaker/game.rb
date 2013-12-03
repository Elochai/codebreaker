require_relative 'guess'
module Codebreaker
	class Game
		attr_accessor :code, :guess_code
		attr_reader :answer

		def initialize
			@code = ""
			4.times {@code << "#{rand(1..6)}"}
			@guess_code = ""
			@answer = []
		end

		def guess(guess_code) 
			guess = Codebreaker::Guess.new(guess_code)
			if guess.valid?
				@guess_code = guess_code
			else
				raise "Invalid code!"
			end
		end

		def compare
			code = []
			guess_code = []
			@answer = []
			i = 0
			4.times do
				code << @code[i].to_i
				guess_code << @guess_code[i].to_i
				i+=1
			end
			i = 0
			4.times do
				if code.include? guess_code[i]
					if code[i] == guess_code[i]
						@answer << "+"
					else
						@answer << "-"
					end
				end
				i+=1
			end
			@answer
		end

		def give_hint
			@code[rand(0..3)]
		end
	end
end
