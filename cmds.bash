#!/usr/bin/env bash


read nick chan cmd args saying
if `echo $saying | grep -i '\bneed a bot\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: you could write it..."
elif `echo $saying | grep -i 'bot \bneeds\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: make a pull request :D"
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
 

