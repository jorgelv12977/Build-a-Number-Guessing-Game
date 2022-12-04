#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

DISPLAY() {

  #get username
  echo "Enter your username:"
  read USERNAME

  #get username from db
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

  #if user present
  if [[ $USER_ID ]]
  then
    #get games played
    GAMES_PLAYED=$($PSQL "SELECT count(user_id) FROM games WHERE user_id = $USER_ID")

    #get best game (guess)
    BEST_GAME=$($PSQL "SELECT min(guesses) FROM games WHERE user_id = $USER_ID")

    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    #if u_name not present in db
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

    #insert to users table
    INSERTED_TO_USERS=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    #get user_id
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    # echo $USER_ID
  fi
  GAME
}

GAME() {
  #secret number
  SECRET=$((1 + $RANDOM % 1000))

  #count guesses
  TRIES=0

  #guess number
  # echo $SECRET
  GUESSED=0
  echo -e "\nGuess the secret number between 1 and 1000:"

  while [[ $GUESSED = 0 ]]
  do
    read GUESS

    #if not a number
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    #if correct guess
    elif [[ $SECRET = $GUESS ]]
    then
      TRIES=$(($TRIES + 1))
      echo -e "\nYou guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
      #insert into db
      INSERTED_TO_GAMES=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $TRIES)")
      GUESSED=1
    #if greater
    elif [[ $SECRET -gt $GUESS ]]
    then
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's higher than that, guess again:"
    #if smaller
    else
      TRIES=$(($TRIES + 1))
      echo -e "\nIt's lower than that, guess again:"
    fi
  done
}

DISPLAY
