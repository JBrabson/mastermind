<mastermind.rb> kicks off the game

display @welcome_message =
Welcome to MASTERMIND
Would you like to (p)lay, read the (i)nstructions, or (q)uit?
  - if (p) then start game
  - if (i) then display @instructions and loop back to @welcome_message
  - if (q) then exit
  - if (anything else) display @start_error_message

@red_peg = correct color && correct location
@white_peg = correct color && incorrect location

#start_game /logic for p workflow/

display @start_game_message =
I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?
@get_user_guess (gets.chomp.downcase)// They can then enter a guess in the form rrgb

#evalute user input for valid?
- If it’s 'q' or 'quit' then #exit the game
- If it’s 'c' or 'cheat' then #print out the current @secret_code
- If it’s fewer than four letters, tell them it’s too short
- If it’s longer than four letters, tell them it’s too long
- If they guess the secret sequence, enter the end game flow below

#play_game //while loop when valid? == true && @codemaker_guess != @secret_code
#compare user input to secret_code
@red_peg_count = correct color && correct location
@white_peg_count = correct color && incorrect location

display @incorrect_guess_message =
@user_input has @red_peg_count of the correct elements with @white_peg_count in the correct positions
You've taken @guess_count guesses
Loop back to @start_game_message or create a new @continue_game message


@End_Game_Winner_Message when @codemaker_guess != @secret_code
Congratulations! You guessed the sequence @user_guess in @guess_count guesses over @timer //display as 4 minutes, 22 seconds.
Do you want to (p)lay again or (q)uit?

get @end_game_user_input

#end_game_decision
- If they enter 'p' or 'play' then restart the game. '
- q' or 'quit' ends the game.
