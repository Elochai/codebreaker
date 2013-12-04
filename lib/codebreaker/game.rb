require_relative 'guess'
module Codebreaker
  class Game
    attr_accessor :code, :guess_code
    attr_reader :answer
    def initialize
      @code = ""
      Code_length.times {@code << "#{rand(1..6)}"}
      @guess_code = ""
      @answer = []
    end

    def valid?
       if @code =~ /^[1-6]{#{Code_length}}$/
        true
      else
        false
      end
    end
    
    def guess(guess_code) 
      guess = Codebreaker::Guess.new(guess_code)
      if guess.valid?
        @guess_code = guess_code
      else
        raise "Your code must contain 4 numbers in range from 1 to 6!"
      end
    end

    def compare
      code = []
      guess_code = []
      @answer = []
      i = 0
      Code_length.times do
        code << @code[i].to_i
        guess_code << @guess_code[i].to_i
        i+=1
      end
      i = 0
      Code_length.times do
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
      @code[rand(0..Code_length-1)]
    end
  end
end
