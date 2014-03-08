#!/bin/bash
# original code by krinkle (cmurphy) edited by dom as a fork
mkfifo .botfile
export foodfile="foods.txt"
export chan=$1
if [ "$2" != '' ] && [ -f "$2" ] ; then
  export key=`cat $2`
fi

readfoods(){

    cat foods.txt | while read line 
        do
        echo "PRIVMSG #$chan :$line" >> .botfile
        sleep 1
    done <foods.txt
# case `date +%H` in 
#   14) sed -n '1,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;& 
#   15) sed -n '2,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   16) sed -n '3,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   17) sed -n '4,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   18) sed -n '5,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   19) sed -n '6,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   20) sed -n '7,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   21) sed -n '8,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   22) sed -n '9,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   23) sed -n '10,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   00) sed -n '11,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   01) sed -n '12,13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   *) sed -n '13' < foods.txt | while read line 
#       do echo "PRIVMSG #$chan :$line" >> .botfile; sleep 1 ;&
#   esac


}

tail -f .botfile | openssl s_client -connect irc.cat.pdx.edu:6697 | while true; do
  if [[ -z $started ]] ; then
    echo "USER needabotbot needabotbot needabotbot :needabotbot" >> .botfile
    echo "NICK needabotbot" >> .botfile
    echo "JOIN #$chan $key" >> .botfile
    started="yes"
  fi
  read irc
  echo $irc
  if `echo $irc | cut -d ' ' -f 1 | grep PING > /dev/null`; then
    echo "PONG" >> .botfile 
  elif `echo $irc | grep PRIVMSG | grep 'need a bot\b' > /dev/null` ; then
    nick="${irc%%!*}"; nick="${nick#:}"
    if [[ $nick != 'needabotbot' ]] ; then
#      chan=`echo $irc | cut -d ' ' -f 3`
      echo "PRIVMSG #$chan :you could write it..." >> .botfile
    fi
  elif `echo $irc | grep PRIVMSG | grep 'bot needs to\b' > /dev/null` ; then

   nick="${irc%%!*}"; nick="${nick#:}"
   echo "PRIVMSG #$chan :submit a pull request!" >> .botfile

  elif `echo $irc | grep PRIVMSG | grep 'bot should\b' > /dev/null` ; then
  
    nick="${irc%%!*}"; nick="${nick#:}"
    echo "PRIVMSG #$chan :make an issue!" >> .botfile


#  elif `echo $irc | grep PRIVMSG | grep 'nabb: what is open?' > /dev/null` ; then
  elif `echo $irc | grep PRIVMSG | grep 'nabb:'| grep 'open' > /dev/null` ; then
        nick="${irc%%!*}"; nick="${nick#:}"
        readfoods

  elif `echo $irc | grep PRIVMSG | grep 'needabotbot:'| grep 'open' > /dev/null` ; then
        nick="${irc%%!*}"; nick="${nick#:}"
        readfoods

      
#      cat foods.txt | sed "s/^/PRIVMSG #$chan :/" >> .botfile     
#  elif `echo $irc | grep PRIVMSG | grep 'nabb: add ' > /dev/null` ; then  
#      sed 's/
  
  
  fi       
 
done



