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
    echo "  System Information                    "
    echo "----------------------------------------"
    echo "Operating system : Linux"
    /usr/bin/lsb_release -a $sysinfo
    echo $sysinfo
  elif [ $number == 2 ]
  then
    echo "----------------------------------------"
    echo "  Hostname and DNS information          "
    echo "----------------------------------------"
    host=$(hostname)
  	dns=$(hostname -d)
  	fqdn=$(hostname -f)
  	ipaddr=$(hostname -I)
  	nameserver=$(grep -o "nameserver.*" /etc/resolv.conf | cut -c 12-)
  	echo "Hostname : $host"
  	echo "DNS Domain : $dns"
  	echo "Fully Qualified Domain Name : $fqdn"
  	echo "Network Address (IP) : $ipaddr"
  	echo "DNS name servers (DNS IP) : $nameserver"
  elif [ $number == 3 ]
  then
    echo "----------------------------------------"
    echo "  Network Information                   "
    echo "----------------------------------------"
    interfaces=$(ls -A /sys/class/net | wc -l)
    echo "Total network interfaces found: $interfaces"
  	echo "*** IP Addresses Information ***"
  	ip addr $ipaddress
    echo $ipaddress
  	echo "****************************************"
  	echo "*** Network Routing ****"
  	echo "****************************************"
  	netstat -rn $networkRouting
    echo $networkRouting
  	echo "****************************************"
  	echo "*** Interface Traffic Information ***"
  	echo "****************************************"
  	netstat -i $traffic
    echo $traffic
  elif [ $number == 4 ]
  then
    echo "----------------------------------------"
    echo "  Who is online                         "
    echo "----------------------------------------"
    who -H $whoIsOnline
    echo $whoIsOnline
  elif [ $number == 5 ]
  then
    echo "----------------------------------------"
    echo "  List of last logged in users          "
    echo "----------------------------------------"
    last | head -n 10 $noUsers
    echo $noUsers
  elif [ $number == 6 ]
  then
    echo "----------------------------------------"
    echo "  Public IP information                 "
    echo "----------------------------------------"
    myip="$(dig +short myip.opendns.com @resolver1.opendns.com)"
    echo $myip
  elif [ $number == 7 ]
  then
    echo "----------------------------------------"
    echo "  Disk Usage Info                       "
    echo "----------------------------------------"
    df --output=source,pcent
  elif [ $number == 8 ]
  then
    echo "----------------------------------------"
    echo "   File-Tree                            "
    echo "----------------------------------------"
    ./proj1.sh /home/ ~/filetree.html 2>/dev/null
  elif [ $number == 9 ]
  then
    echo "----------------------------------------"
    echo "  Process operations                    "
    echo "----------------------------------------"
  fi
  echo "Press [Enter] key to continue.."
  read number

done
