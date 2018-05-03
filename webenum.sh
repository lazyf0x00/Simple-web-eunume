#!/bin/bash
clear
echo "" && echo ""
echo "    ╔────────────────────────────────────────────────────────────────╗"
echo "    |  The author does not hold any responsibility for the bad use   |"
echo "    |  of this tool, remember that attacking targets without prior   |"
echo "    |  consent is illegal and punished by law.                       |"
echo "    |                                                                |"
echo "    |      Author:vivek chauhan | Team PyramidCyber                  |"
echo "    |        This script work with kali linux only                   |"
echo "    |      ./webenum.sh IP or www.website .com                       |"
echo "    |                                                                |"
echo "    |                                                                |"
echo "    ╠────────────────────────────────────────────────────────────────╝"
echo "" && echo ""
sleep 2

if [ -z "$1" ]
  then
echo "========================================================================="  
      echo "Please provide host name to enumerate (./webenum.sh IP or www.site.com)"
echo "========================================================================="      
      exit
else
echo "========================================================================"
      echo "Running Nmap against http://$1"
echo "========================================================================"
      nmap -v $1 -Pn -A -T4 -F -oX a.xml; searchsploit --nmap a.xml 
      echo ""  && echo "" 
      sleep 3
echo "========================================================================="   
      echo "Running Nikto against http://$1"
echo "========================================================================="
      echo ""  && echo ""
      nikto -C all -h http://$1 -T x 6
      echo ""  && echo ""
      sleep 3
echo "=========================================================================="      
      echo "Running dirb against http://$1"
echo "=========================================================================="
      dirb http://$1 /usr/share/dirb/wordlists/common.txt | grep 'CODE:200'
       
      
fi            