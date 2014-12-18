#!/bin/bash
touch /u/masont/Documents/botideas

read nick chan saying
if `echo $saying | grep -i '\bneed a\b' | grep -i '\bbot\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: you could write it..."
    echo "$nick: $saying" >> /u/masont/Documents/botideas
elif `echo $saying | grep -i 'bot \bneeds\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: make a pull request :D"
    echo "$nick: $saying" >> /u/masont/Documents/botideas
elif `echo $saying | grep -i 'nabb: source' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: http://goo.gl/IIQt53 is my source file"
    echo "$nick: $saying" >> /u/masont/Documents/botideas
elif `echo $saying | egrep -i 'nabb: I need some ideas' > /dev/null` ; then
    echo "PRIVMSG $nick :Here is what I have for bot ideas as well as who said them: "
    while read line
    do
        echo "PRIVMSG $nick : $line "
    done < /u/masont/Documents/botideas
fi


#case $cmd in
#    "+phone") echo "Answer the phone with \"This is the Computer Action Team, this is ";
#              echo "<yournamegoeshere>, how may I help you?\" You should pick up the phone";
#              echo "after no more than 2 rings, though walk-ins have priority over phone callers. ";
#              echo "See phonehold or phonevoicemail for more. http://goo.gl/oJl7HT";;
#    "+phonevoicemail") echo "Dial 57000. If prompted for extension enter 55420. Dial 'catsonly'" ;
#                       echo " as the password. Dial 1 to listen to the first message. Take notes" ;
#                       echo " on each call and don't delete the message until a proxy ticket has" ;
#                       echo " been made. Notify any CATzen addressed specifically in the call. http://goo.gl/oJl7HT " ;;
#    "+phonehold") echo "Clear the transfer with the person being transferred to via IRC" ;
#                echo "Inform the person on the other end of the phone they are going to be" ;
#                echo "transferred. Press the 'Transfer' button, enter the extension of the" ;
#                echo "senior CAT, press the 'Transfer' button again. http://goo.gl/oJl7HT" ;;
#    "+kek") echo "MAXIMUM kek" ;;
#    "+help") echo "Deskcat helper bot designed by dom (also trolls people)";
#             echo "+phone  -  General phone help";
#             echo "+phonehold  -  Information on transferring calls";
#             echo "+phonevoicemail  -  Information on accessing voicemail";;
#esac
 

