class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(attempt)
    @attempted_chars.each do |char|
      if attempt == char
        return true
      end
    end
    false
  end

  def get_matching_indices(attempt)
    indicies = []
    @secret_word.each_char.with_index do |char, idx|
      if attempt == char
        indicies << idx
      end
    end
    indicies
  end

  def fill_indices(attempt, arr)
    arr.each do |idx|
      @guess_word[idx] = attempt
    end
  end

  def try_guess(attempt)
    if already_attempted?(attempt)
      p "that has already been attempted"
      return false
    else
      @attempted_chars << attempt
    end

    correct = self.get_matching_indices(attempt)
    self.fill_indices(attempt, correct)
      @remaining_incorrect_guesses -= 1 if correct.length == 0

      true
  end



  def ask_user_for_guess
    p "Enter a char"
    input = gets.chomp
    return self.try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    else
      return false
    end
  end

end
