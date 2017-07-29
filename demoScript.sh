#!/bin/bash
echo starting the script

# This section will clone the repository from the github
# LINK variable has to have repo's github link, git required

FOLDER=Battleship_v2
LINK=https://github.com/spanish-inquisition-4/Battleship_v2.git

if [ ! -d "$FOLDER" ]; then
	echo cloning the repository now
	git clone $LINK
	echo Clone completed
else
	echo The repository is already cloned
fi

# entering the cloned repo if the folder exists
if [ ! -d "$FOLDER" ]
then
	echo Directory not found!
	exit 1
fi
echo Entering the created directory
cd $FOLDER

# If there is a git hook file in dev_utils copy it to the .git/hooks folder

DEV_UTILS_FOLDER=dev_utils
GITHOOK_FILE=dev_utils/pre-push
GIT_HOOKS_FOLDER=.git/hooks
EXISTING_HOOK=.git/hooks/pre-push
if [ ! -f "$EXISTING_HOOK" ]; then
	if [ -d "$DEV_UTILS_FOLDER" ]; then
		if [ -f "$GITHOOK_FILE" ] && [ -d "$GIT_HOOKS_FOLDER" ]
		then
			echo Copying a git hook
			ls
			cp $GITHOOK_FILE $GIT_HOOKS_FOLDER
		fi
	fi
else 
	echo Ok, Hook already in place
fi

# If the quality check was selected, run the checkQuality script

if [ -n $1 ]
then
	QUALITY_SCRIPT=checkQuality.sh
	if [ "$1" = -q ] && [ -f "$QUALITY_SCRIPT" ]
	then
		echo Checking the quality now.
		sh checkQuality.sh
	fi
fi
