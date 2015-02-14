#!/bin/bash
touch ../botideas
randint=`dice 9`

read nick chan saying
if `echo $saying | grep -i '\bneed a\b' | grep -i '\bbot\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: you could write it..."
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i 'bot \bneeds\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: make a pull request :D"
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i 'nabb: source' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: http://goo.gl/IIQt53 is my source file"
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i '!dropthemic' > /dev/null` ; then
    echo "PRIVMSG $chan : OOOOH! You just got *served*!"
elif `echo $saying | grep -i 'nabb: are you a bot?' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: I sure am :)"
elif `echo $saying | grep -i '!kekball' > /dev/null` ; then
    kekball=`sed -n "$randint"p kekball`
    echo "PRIVMSG $chan :$nick: $kekball"
elif `echo $saying | egrep -i 'nabb: I need some ideas' > /dev/null` ; then
    echo "PRIVMSG $nick :Here is what I have for bot ideas as well as who said them: "
    while read line
    do
        echo "PRIVMSG $nick : $line "
    done < ../botideas
fi


