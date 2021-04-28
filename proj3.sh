#! /bin/bash

clear
time=$(date -u)
echo $time
echo "----------------------------------------"
echo "                Main Menu               "
echo "----------------------------------------"
echo "1.  Operating system info"
echo "2.  Hostname and DNS info"
echo "3.  Network info"
echo "4.  Who is online"
echo "5.  Last logged in users"
echo "6.  My IP address"
echo "7.  My disk usage"
echo "8.  My home file-tree"
echo "9.  Process operations"
echo "10. Exit"
echo "Enter your choice [1 - 10]"
read number
for (( ; ; ))
do
  if [[ $number = "" ]];
  then
    time=$(date -u)
    echo $time
    echo "----------------------------------------"
    echo "                Main Menu               "
    echo "----------------------------------------"
    echo "1.  Operating system info"
    echo "2.  Hostname and DNS info"
    echo "3.  Network info"
    echo "4.  Who is online"
    echo "5.  Last logged in users"
    echo "6.  My IP address"
    echo "7.  My disk usage"
    echo "8.  My home file-tree"
    echo "9.  Process operations"
    echo "10. Exit"
    echo "Enter your choice [1 - 10]"
    read number
  fi
  if [ $number == 10 ]
  then
    exit

  elif [ $number == 1 ]
  then
    echo "----------------------------------------"
    echo "  System Information               "
    echo "----------------------------------------"
    echo "Operating system : Linux"
    /usr/bin/lsb_release -a $this
    echo $this
  elif [ $number == 2 ]
  then
    echo "Here:2"
  elif [ $number == 3 ]
  then
    echo "Here:3"
  elif [ $number == 4 ]
  then
    echo "Here:4"
  elif [ $number == 5 ]
  then
    echo "Here:5"
  elif [ $number == 6 ]
  then
    echo "Here:6"
  elif [ $number == 7 ]
  then
    echo "Here:7"
  elif [ $number == 8 ]
  then
    echo "Here:8"
  elif [ $number == 9 ]
  then
    echo "Here:9"
  fi
  echo "Press [Enter] key to continue.."
  read number

done
