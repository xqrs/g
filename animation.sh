#!/bin/sh --
set -ue; export POSIXLY_CORRECT=1

nl='
' e=$(printf \\033)
rands=
rand(){ 
	case $rands in "")
	rands=$(awk 'BEGIN{ORS=" ";srand();for(i = 0; i < 100; i++) print int(rand()*6 + 1)}')
	esac
	x=${rands%% *}
	rands=${rands#* }
}

while
	lastx=
	bday=
	for c in b d a y;do
		rand
		[ "$x" != "$lastx" ] || x=$((x+1))
		bday="$bday$e[1;9${x}m$c"
		lastx=$x
	done
	bday="$bday$e[m"
	lastx=
	happybday=
	for c in H A P P Y ' ' B I R T H D A Y;do
		rand
		[ "$x" != "$lastx" ] || x=$((x+1))
		happybday="$happybday$e[1;9${x}m$c"
		lastx=$x
	done
	happybday="$happybday$e[m"
	cat <<EOF
$e[H$e[3J$e[J   Pearl                                          Me with my lil beard
     |                                       (yes, it has a hole in the middle) 
     |                                                     |
     V                                                     |
                                                           V
   $e[1;96m%$e[;96m_____                                                 $e[1;93m_..__
   $e[;96m/ 0  0\\                          $e[m[ $e[1mHappy $bday! ]--    $e[1;93m/0 0  \\
   $e[;96m \\__v/  $e[m--[ $e[1mOh, thanks $e[93m3bd$e[;1m!$e[m ]                         $e[1;93m\\:.w.:/
   $e[;96m /   |                                                $e[1;93m|\`\` \`\`\\$e[m

              +------------------------------------------+
              | Once again I need to write down a card…  |
              | One year ago I tried it and it was hard  |
              |      How many times I have to say…       |
              |   $e[96mShe$e[m's a beautiful friend till today!   |
              |     $e[96mShe$e[m has the nicest sense of art…     |
              |  if I measure it'd exceed every chart!   |
              |     Do I need to say hello my friend     |
              | do I keep it simple or do a crazy trend? |
              |   You might got some little struggles.   |
              |   but never wavered your nice chuckles   |
              |  I’m sorry for the elongation and delay  |
              |   all I want to say is $happybday!   |
              +----------------------------[ By $e[1;91mAdel$e[m ]---+
EOF
do sleep 0.4;done
