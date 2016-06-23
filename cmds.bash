#!/bin/bash
touch ../botideas
randint=`dice 9`

read nick chan saying
if `echo $saying | grep -i '\bneed a\b' | grep -i '\bbot\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: you could write it..."
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i 'bot \bneeds\b' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: make a pull request :^D"
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i 'nabb: source' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: http://goo.gl/IIQt53 is my source file"
    echo "$nick: $saying" >> ../botideas
elif `echo $saying | grep -i '!dropthemic\b' > /dev/null` ; then
    echo "PRIVMSG $chan :OOOOH! You just got *served*!"
elif `echo $saying | grep -i 'nabb: are you a bot?' > /dev/null` ; then
    echo "PRIVMSG $chan :$nick: I sure am :^)"
elif `echo $saying | grep -i '!domsmugnessquotient' > /dev/null` ; then
    echo "PRIVMSG $chan :I think we all know..."
elif `echo $saying | grep -i 'sudo make me a sandwich' > /dev/null` ; then
    echo "PRIVMSG $chan :That isn't the way that works and you know it :^)"
elif `echo $saying | grep -i 'accio corndog' > /dev/null` ; then
    echo "PRIVMSG zb :zb buy corndog as $nick"
    echo "PRIVMSG $chan :got it! Fetching..."
elif `echo $saying | grep -i 'accio corn dog' > /dev/null` ; then
    echo "PRIVMSG zb :zb buy corndog as $nick"
    echo "PRIVMSG $chan :got it! Fetching..."
elif `echo $saying | grep -i 'nabb: make me a sandwich' > /dev/null` ; then
    if [ "$nick" = dom ] ; then
        echo "PRIVMSG $chan :$nick: Sure thing, buddy."
    elif [ "$nick" = relsqui ] ; then
        echo "PRIVMSG $chan :$nick: Alright, I *guess* I can make you a sandwich."
    elif [ "$nick" = Aatrox ] ; then
        echo "PRIVMSG $chan :$nick: I've got a Nature Valley bar, is that good enough?"
    elif [ "$nick" = sweets ] ; then
        echo "PRIVMSG $chan :$nick: Though I cannot give you proof that sandwiches exist, I do believe they are out there, and that we are not alone in the universe."
    elif [ "$nick" = wheezl ] ; then
        echo "PRIVMSG $chan :$nick: OK, here you go!"
    elif [ "$nick" = squid ] ; then
        echo "PRIVMSG $chan :$nick: Here's two pieces of SPAM bread with a nice thick slice of SPAM in the middle. De-lish."
    elif [ "$nick" = Envy ] ; then
        echo "PRIVMSG $chan :$nick: I cast Bread, floating 3 green mana, play Jelly, go up to 5, tutor for Peanut Butter, present lethal. Responses?"
    elif [ "$nick" = mancat ] ; then
        echo "PRIVMSG $chan :$nick: Make your own dang sandwich, Mannius J Aberforth Catt Felinus Jr!"
    elif [ "$nick" = tombat ] ; then
        echo "PRIVMSG $chan :$nick: Here you go. Its a hip new combination, but its pretty underground, you've probably never heard of it."
    elif [ "$nick" = thyme ] ; then
        echo "PRIVMSG $chan :$nick: Alright, its sandwich thyme."
    elif [ "$nick" = Reeves ] ; then
        echo "PRIVMSG $chan :$nick: I've always got time to make sandwiches for Neo."
    elif [ "$nick" = fouric ] ; then
        echo "PRIVMSG $chan :$nick: ((((((((((sandwich))))))))))"
    else
       echo "PRIVMSG $chan :$nick: Ehhhhh, I dunno."
    fi        
elif `echo $saying | grep -i 'nabb: help\b' > /dev/null` ; then
    if [ "$nick" = dom ] ; then
        echo "PRIVMSG $chan :dom: Shouldn't you already know?"    
    else
        echo "PRIVMSG $chan :$nick: ask me for my source!"
    fi 
elif `echo $saying | grep -i 'nabb: join\b' > /dev/null` ; then
    if [ "$nick" = dom ] ; then
        channel=`echo $saying | cut -d ' ' -f 3`
        chankey=`echo $saying | cut -d ' ' -f 4`
        echo "JOIN $channel $chankey"
    fi
elif `echo $saying | grep -i 'nabb: leave\b' > /dev/null` ; then
    if [ "$nick" = dom ] ; then
        channel=`echo $saying | cut -d ' ' -f 3`
        echo "PART $channel"
    fi
elif `echo $saying | grep -i 'nabb: spam\b' > /dev/null` ; then
    ticket=`echo $saying | cut -d ' ' -f 3` 
    if [ "$nick" = dom ] ; then
        if [[ $ticket =~ ^[0-9]{6}$ ]] ; then 
            snot -F SPAM $ticket
        fi 
    fi
elif `echo $saying | grep -i 'assigned' | grep -i 'mwilliam' > /dev/null` ; then
    if [ "$nick" = _ ] ; then
        echo $saying | cut -d ' ' -f 3 >> watchtix
    fi
elif `echo $saying | grep -i 'updated by' > /dev/null` ; then
    if [ "$nick" = _ ] ; then
        tik=`echo $saying | cut -d ' ' -f 1`
        if `grep -i $tik watchtix > /dev/null` ; then
            echo "PRIVMSG #snot :thyme: ^"
        fi
    fi
elif `echo $saying | grep -i '!kekball' > /dev/null` ; then
    kekball=`sed -n "$randint"p kekball`
    echo "PRIVMSG $chan :$nick: $kekball"
fi


