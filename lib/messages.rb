require './lib/game'

class Messages

  def start_message
      puts  '        -------------------------------------------
       |         Welcome to MASTERMIND...          |
       |        Need some (i)nstructions?          |
       |         Are you ready to (p)lay?          |
       |    Or (q)uit now and come back later?     |
        -------------------------------------------'
  end

  def play
     puts "I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?"
  end

  def instructions
    puts "    Way to rise to the challenge! And here's the name of the game: Think of the
    computer as your opponent. Opponent chooses a secret code, that is a combination of
    (r)ed, (g)reen, (b)lue, (y)ellow - and it's hidden from you for the
    duration of the game. Your job is to guess the combination and guesses should be any
    four character combinations of r, b, y, g. For any of the for positions containing the
    correct color in the secret code, you will be awarded a correct guess. For any color in
    your guess that is also in the same position in the secret code, you will be awarded
    a correct guess. Use the correct guess points to determine the secret code! Now it's your
    job to break the code and become the new Mastermind! Press (p)lay if you're ready for
    the challenge or (q) to exit the game."
  end

  def quit
    puts "I'll be waiting for you to accept the challenge. Same time. Same place.
    When you're ready. Adios!"
  end

  def input_invalid
      messages = ["'Ich verstehe nicht'. Oh, don't understand? Neither do I. Type i, p, or q.",
                  "'ʻAʻole maopopo iaʻu'. Translated: I don't understand... please type i or p to begin, or q to quit.",
                  "'Ní thuigim'... is Irish for 'I don't understand' so please type i, p, or q.",
                  "'Sielewi' is Swahili for type i, p, or q so I understand what you're saying.",
                  "Not catching what you're throwing... If you're ready to master some minds... say so by typing p
                  to play. Otherwise i for instruction or q to quit."]
      puts messages.sample
  end

  def invalid_characters
    puts "INVALID CHARACTERS"
  end

  def too_short
    puts "TOO SHORT MESSAGE"
  end

  def too_long
    puts "TOO LONG"
  end

end
