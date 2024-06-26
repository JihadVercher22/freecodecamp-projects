#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"

CUSTOMER_NAME=""
CUSTOMER_PHONE=""
SERVICES=$($PSQL "SELECT service_id, name FROM services")

CREATE_APPOINTMENT(){
    GET_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    GET_CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    SERVICE_NAME=$(echo $GET_SERVICE_NAME | sed 's/\s//g' -E)
    CUST_NAME=$(echo $GET_CUSTOMER | sed 's/\s//g' -E)      
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUST_NAME?"
    read SERVICE_TIME 
    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')") 
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUST_NAME.\n"
}

QUESTIONNAIRE(){
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

HAVE_CUST=$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")

    if [[ -z $HAVE_CUST ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

      CREATE_APPOINTMENT
    else

      CREATE_APPOINTMENT
    fi
}

MAIN_MENU(){
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi

  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
  echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
    MAIN_MENU "\nI could not find that service. What would you like today?"
    else 
    SERVICE_AVAILABLE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")

      if [[ -z $SERVICE_AVAILABLE ]]
      then
      MAIN_MENU "\nI could not find that service. What would you like today?"
      else 
      QUESTIONNAIRE
      fi
    fi
  
}

MAIN_MENU