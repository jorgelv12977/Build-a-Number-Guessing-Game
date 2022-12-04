#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

echo "Enter your username:"
read USERNAME_INPUT

OLD_PLAYER=$($PSQL "SELECT username, games_played, best_game FROM game_info WHERE username='$USERNAME_INPUT'")
if [[ -z $OLD_PLAYER ]]
then
  echo -e "\nWelcome, $USERNAME_INPUT! It looks like this is your first time here."
  NUMBER_GUESSES=1
  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    while [[ ! $GUESS =~ ^[0-9]+$ ]]
    do 
    echo "That is not an integer, guess again:"
    read GUESS
    done
  else
    if [[ $GUESS = $NUMBER ]]
    then
      echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $NUMBER. Nice job!"
      INSERT_INFO=$($PSQL "INSERT INTO game_info (username, games_played, best_game) VALUES ('$USERNAME_INPUT', 1, $NUMBER_GUESSES)")
    else
      while [[ $GUESS != $NUMBER ]]
      do
        ((NUMBER_GUESSES++))
        if [ $GUESS -gt $NUMBER ]
        then
          echo "It's lower than that, guess again:"
          read GUESS
          if [[ ! $GUESS =~ ^[0-9]+$ ]]
          then
            while [[ ! $GUESS =~ ^[0-9]+$ ]]
            do 
            echo "That is not an integer, guess again:"
            read GUESS
            done 
          fi
        else
          echo "It's higher than that, guess again:"
          read GUESS
          if [[ ! $GUESS =~ ^[0-9]+$ ]]
          then
            while [[ ! $GUESS =~ ^[0-9]+$ ]]
            do 
              echo "That is not an integer, guess again:"
              read GUESS
            done
          fi  
        fi
      done
      echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $NUMBER. Nice job!"
      INSERT_INFO=$($PSQL "INSERT INTO game_info (username, games_played, best_game) VALUES ('$USERNAME_INPUT', 1, $NUMBER_GUESSES)")
    fi
  fi

else
  echo $OLD_PLAYER | while IFS=" |" read USERNAME GAMES_PLAYED BEST_GAME
  do
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM game_info WHERE username='$USERNAME_INPUT'")
  BEST_GAME=$($PSQL "SELECT best_game FROM game_info WHERE username='$USERNAME_INPUT'")
  ((GAMES_PLAYED++))
  NUMBER_GUESSES=1
  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    while [[ ! $GUESS =~ ^[0-9]+$ ]]
    do 
    echo "That is not an integer, guess again:"
    read GUESS
    done
  else
    if [[ $GUESS = $NUMBER ]]
    then
      echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $NUMBER. Nice job!"
      UPDATE_INFO_GAMES=$($PSQL "UPDATE game_info SET games_played=$GAMES_PLAYED WHERE username='$USERNAME_INPUT'")
      UPDATE_INFO_BEST=$($PSQL "UPDATE game_info SET best_game=$NUMBER_GUESSES WHERE username='$USERNAME_INPUT'")
    else
      while [[ $GUESS != $NUMBER ]]
      do
        ((NUMBER_GUESSES++))
        if [ $GUESS -gt $NUMBER ]
        then
          echo "It's lower than that, guess again:"
          read GUESS
          if [[ ! $GUESS =~ ^[0-9]+$ ]]
          then
            while [[ ! $GUESS =~ ^[0-9]+$ ]]
            do 
            echo "That is not an integer, guess again:"
            read GUESS
            done 
          fi
        else
          echo "It's higher than that, guess again:"
          read GUESS
          if [[ ! $GUESS =~ ^[0-9]+$ ]]
          then
            while [[ ! $GUESS =~ ^[0-9]+$ ]]
            do 
              echo "That is not an integer, guess again:"
              read GUESS
            done
          fi  
        fi
      done
      echo -e "\nYou guessed it in $NUMBER_GUESSES tries. The secret number was $NUMBER. Nice job!"
      UPDATE_INFO_GAMES=$($PSQL "UPDATE game_info SET games_played=$GAMES_PLAYED WHERE username='$USERNAME_INPUT'")
      if [[ $NUMBER_GUESSES -lt $BEST_GAME ]]
      then
        UPDATE_INFO_BEST=$($PSQL "UPDATE game_info SET best_game=$NUMBER_GUESSES WHERE username='$USERNAME_INPUT'")
      fi
    fi
  fi
fi

