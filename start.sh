#!/bin/bash

source ./setup.sh

RESUME=`cat .resume`
BAN=false
BANEXCLUDE=false

for k in "${EXCLUDES[@]}"
do
	EXCLUDEMIX+="--exclude=$k "
done
if [ "$RESUME" != "" ]; then
		RESUME=`cat .resume`
	else
		BAN=true
fi
for i in "$SOURCE"/*;
do
	if [ "$i" == "$RESUME" ]; then
		BAN=true
	fi
	if [ -d "$i" ] && [ "$BAN" == true ]; then
		echo "$i" > ".resume"
		RESUME=`cat .resume`
		for j in "${ONLYDIRS[@]}"
		do
			if [ "$j" == "$i" ] || [ "$j" == "*" ]; then
				NAME=${i##*/}
				for k in "${EXCLUDES[@]}"
				do
					if [ "$NAME" == "$k" ]; then
						BANEXCLUDE=true
					fi
				done
				if [ $BANEXCLUDE != true ]; then
					printf "n $DESTINATION/$NAME-%02d.tar\n" {2..74} | tar $EXCLUDEMIX -ML $VOLUMESIZE $OPTIONS "$DESTINATION"/"$NAME".tar "$i"
				fi
				BANEXCLUDE=false
			fi
		done
  	fi
done
echo "" > ".resume"