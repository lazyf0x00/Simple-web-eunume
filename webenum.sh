#!/bin/bash
clear

echo "______________________________________________________________________"
echo "______________________________________________________________________"
echo "      The author does not hold any responsibility for the bad use     "
echo "      of this tool, remember that attacking targets without prior     "
echo "      consent is illegal and punished by law.  :P                     "
echo "                                                                      "
echo "          Author:vivek chauhan | Team PyramidCyber                    "
echo "            This scr1t work with kali linux only                      "
echo "                                                                      "
echo "             Kernal Version:$(uname -r)                               "
echo "             Machine Arch:$(uname -m)                                 "
echo "             OS:$(uname -on)                                          "
echo "                                                                      "
echo "______________________________________________________________________"
echo "______________________________________________________________________"

sleep 2
echo
echo
if [ -z "$1" ]
  then
echo       "================================================================================"  
      echo "Please provide host name or ip to enumerate (./webenum.sh 1 or www.site.com)"
echo       "================================================================================"      
      exit
else
echo "========================================================================"
      echo "Running Nmap against http://$1"
echo "========================================================================"
      echo ""  && echo ""
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
      echo ""  && echo ""
      dirb http://$1 /usr/share/dirb/wordlists/common.txt | grep 'CODE:200'
      echo ""  && echo ""
      sleep 3
echo "=========================================================================="      
      echo "Running dnsrecon against http://$1"
echo "=========================================================================="
      echo ""  && echo ""      
      dnsrecon -d http://$1 -t std -a
      echo ""  && echo ""
      
fi            
