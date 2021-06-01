exit=0
phoneBook="phonebook.txt"


while [ $exit -ne 1 ]
do
  echo Select the Operation
  printf "1.Add An Entry\n2.Display List\n3.Sort and Display\n4.Delete\n5.Exit\n"
  printf "        Enter Your Choice: "
  read answer
  if [ "$answer" -eq 1 ]
  then
    printf "Enter the first name: "
    read fname
    printf "Enter the last name: "
    read lname
    printf "Enter the phone number: "
    read number
    echo "$fname:$lname:$number" >> $phoneBook
  elif [ "$answer" -eq 2 ]
  then
    printf "Enter the option\n1.Dispaly all\n2.Display specific one\n"
    printf "        Enter Your Choice: "
    read option
    if [ "$option" -eq 1 ]
    then
      echo The available phone records are:
      cat $phoneBook
    else
      printf "Enter the name or phone number: "
      read option
      echo The available phone records are:


      grep $option $phoneBook
    fi
  elif [ "$answer" -eq 3 ]
  then
  printf "1.Sort by firstName\n2.Sort by lastName\n3.Sort by phoneNumber\n"
  printf "Enter the corresponding number to sort: "
  read pattern
  echo The sorted list of phone book by last name:
  echo -------------------------------------------
    if [ "$pattern" -eq 1 ]
    then
      sort -t" " -k 1 $phoneBook
      echo -------------------------------------------
    elif [ "$pattern" -eq 2 ]
    then
      sort -t" " -k 2 $phoneBook
    echo -------------------------------------------
    else
      sort -t":" -k 2 $phoneBook
      echo -------------------------------------------
    fi
  elif [ "$answer" -eq 4 ]
  then
    printf "Enter the phoneNumber to delete record: "
    read phone
    sed -i "/$phone/d" $phoneBook
  elif [ "$answer" -eq 5 ]
  then
    exit=1
  else
  printf "No such options. Please select again\n"
  fi
done
