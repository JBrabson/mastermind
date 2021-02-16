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
     puts "     I have my secret code. Remember it can be any four-in-length combination
     of (r)ed, (g)reen, (b)lue, and (y)ellow. (Keep in mind: it could be all of one
     color, or none of another color, etc... you're welcome.)
     Use (q)uit at any time to end the game.

     What's your guess?"
  end

  def instructions
    puts "    The name of the game:

    Think of the computer as your opponent. Opponent chooses a secret code, and that
    secret code is a combination of (r)ed, (b)lue, (g)reen, (y)ellow. Examples: RRRR,
    BYGR, YYGG... can be any combination with a length of four. This secret code is
    hidden from you for the duration of the game (unless you pick the option to cheat...
    but don't cheat).
    After each guess, you'll know which parts of your guess are correct.
    Use this information to determine the next best guess... until you break the code!

    Use (q)uit at any time to quit the game... but the better option?
    Press (p)lay if you're ready for the challenge!

    The CodeMaker has chosen their code... it's now your job to break it."
  end

  def quit
    messages = ["    Sad to see you go... I've been waiting for someone to show the CodeMaker who's boss...
    They've got a real attitude. So... come back again soon, ya? And bring your A Game.",
    "Booooo. I wanted to see you winnnnn. Bye.",
    "But did you mean to quit the game? I'll pretend it was an accident. Adios.",
    "You chose to quit the game. This makes me sad. Goodbye."]
    puts messages.sample
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
    messages = ["    No comprende, amigo. Make sure your guess includes ONLY the colors in the game (R, B, G, or Y). Give it another go.",
                "    Giving you the benefit of the doubt and assuming your fingers slipped. Guesses have to be comprised of the colors in the game: R, B, G, or Y. Reguess!",
                "Hey buddy. Remember the instructions? Only R, B, G, or Y can be in the guess. Try again.",
                "R, B, G, Y only! Guess again!"]
    puts messages.sample
  end

  def too_short
    messages = ["Four means one, two, three, FOUR. Your guess input was too short. Try again.",
                "Guess is too short. 1 + 1 + 1 + 1 = 4. Please try again."]
    puts messages.sample
  end

  def too_long
    messages = ["Four means one, two, three, FOUR. Not four plus more. Your guess was too long. Try again.",
                "4 does not equal 4 + more. It means four. New guess time... and make sure it counts (only four long)."]
    puts messages.sample
  end

  def too_short_invalid_character
    puts "    That's 0 for 2! Your guess is too short annnnnd has colors not allowed.
    Guess again, my friend... make sure it's four long and have R, B, G, Y only."
  end

  def too_long_invalid_character
    puts "    *Face Palm*   Your guess is too long. This is not a rhyme. It's me
    telling you to shorten your guess to four in line, and only including colors
    from the R, B, G, Y song. (Song doesn't exist but I can do what I want. Only
    R, B, G, Y this time. And only 1, 2, 3, 4 long.)"
  end
end
