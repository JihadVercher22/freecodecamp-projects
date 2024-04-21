#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS=',' read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do 
if [[ $YEAR != "year" && $ROUND != "round" && $WINNER != "winner" && $OPPONENT != "opponent" && $WINNER_GOALS != "winner_goals" && $OPPONENT_GOALS != "opponent_goals" ]]
then
  #INSERT TEAM_ID

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNER_ID ]]
    then 
    INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER == "INSERT 0 1" ]]
      then
        echo $INSERT_WINNER
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE team_id='$WINNER_ID'")
      echo "Winner Submitted : ${WINNER_NAME}"
      fi
    fi

    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
    INSERT_OPP=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPP == "INSERT 0 1" ]]
      then
        echo $INSERT_OPP
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
      OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE team_id='$OPPONENT_ID'")
      echo "Opponent Submitted : {$OPPONENT_NAME}"
      fi
    fi

  #INSERT GAMES
  INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then
      echo $INSERT_GAMES
      echo "Game Submitted : $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS"
    fi
fi
done