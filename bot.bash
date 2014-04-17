#!/bin/bash
# original code by krinkle (cmurphy) edited by dom as a fork
# initialize variables from passed in variables
mkfifo .botfile
export foodfile="foods.txt"
export chan=$1
if [ "$2" != '' ] && [ -f "$2" ] ; then
  export key=`cat $2`
fi

# function to read in from a text file and echo to irc the contents of said file
readfoods(){

    cat foods.txt | while read line 
        do
        echo "PRIVMSG #$chan :$line" >> .botfile
        sleep 1
    done <foods.txt
}


tail -f .botfile | openssl s_client -connect irc.cat.pdx.edu:6697 | while true; do

  # Tell irc the things it needs to know to create a user named needabotbot
  if [[ -z $started ]] ; then
    echo "USER needabotbot needabotbot needabotbot :needabotbot" >> .botfile
    echo "NICK needabotbot" >> .botfile
    echo "JOIN #$chan $key" >> .botfile
    started="yes"
  fi

  # Read in and echo irc
  read irc
  echo $irc

  # Whenever irc server send "PING" to user (needabotbot), send back "PONG"
  # so that irc doesn't think you're dced from the server
  if `echo $irc | cut -d ' ' -f 1 | grep PING > /dev/null`; then
    echo "PONG" >> .botfile 
  
  # Whenver nabb sees 'need a bot' somewhere in irc chat, reply with "you could write it"
  elif `echo $irc | grep PRIVMSG | grep 'need a bot\b' > /dev/null` ; then
    nick="${irc%%!*}"; nick="${nick#:}"
    if [[ $nick != 'needabotbot' ]] ; then
      echo "PRIVMSG #$chan :you could write it..." >> .botfile
    fi

  # Whenever nabb sees 'bot needs to' somewhere in irc chat, reply with "submit a pull request"
  elif `echo $irc | grep PRIVMSG | grep 'bot needs to\b' > /dev/null` ; then

   nick="${irc%%!*}"; nick="${nick#:}"
   echo "PRIVMSG #$chan :submit a pull request!" >> .botfile
  
  # Whenever nabb sees 'bot should' somewhere in irc chat, reply with "make an issue"
  elif `echo $irc | grep PRIVMSG | grep 'bot should\b' > /dev/null` ; then
  
    nick="${irc%%!*}"; nick="${nick#:}"
    echo "PRIVMSG #$chan :make an issue!" >> .botfile

  # Whenever nabb is pinged by someone and sees the word open in the same line, replies with all open food
  # places near here
  elif `echo $irc | grep PRIVMSG | grep 'nabb:'| grep 'open' > /dev/null` ; then
        nick="${irc%%!*}"; nick="${nick#:}"
        readfoods

  elif `echo $irc | grep PRIVMSG | grep 'needabotbot:'| grep 'open' > /dev/null` ; then
        nick="${irc%%!*}"; nick="${nick#:}"
        readfoods
  fi       
 
done



