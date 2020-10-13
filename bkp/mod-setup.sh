#!/bin/bash
STEAM_DATA_PATH="C:\Program Files (x86)\Steam\steamapps\common\Skyrim\Data"
#STEAM_DATA_PATH_UNIX='/c/Program Files (x86)/Steam/steamapps/common/Skyrim/Data'


function main()
{
	arg1=$1
	backup_to_commit ${arg1};
}

function help_menu()
{
	echo "This is a simple script I created to help commit my skyrim mods on git."
	echo "Usage:"
	echo "    mod-setup.sh <mod-name>"
}

function pause(){
   read -p "$*"
}

function backup_to_commit()
{
	arg1=$1
	# check if mod name is empty
	echo ${steamDataPath}
	if [ -z "$arg1" ]
	then
		echo "\$arg1 is empty"
		return -1;
	fi
	
	# check if steam data path is empty
	if [ -z "$STEAM_DATA_PATH" ]
	then
		echo "\$STEAM_DATA_PATH is empty"
		return -1;
	fi	

	local modNameEx=${arg1}".esp"
	local modPath=${STEAM_DATA_PATH}"\\"${modNameEx}
	local modBackupDst=".\\"${arg1}"\\"
	
	# check if steam data path exists
	if test -a "$STEAM_DATA_PATH"; then
		echo "[OK]	STEAM_DATA_PATH:$STEAM_DATA_PATH"
	else
		echo "[NOK]	STEAM_DATA_PATH:$STEAM_DATA_PATH"
		return -1
	fi
	
	# check if mod exits
	if test -a "$modPath"; then
		echo "[OK]	modPath:$modPath"
	else
		echo "[NOK]	modPath:$modPath"
		return -1
	fi
	
	# create mod backup dir if does not exit
	if test -a "$modBackupDst"; then
		echo "[OK]	modBackupDst:$modBackupDst"
	else
		mkdir ${modBackupDst}
	fi	

	# do backup
	echo "${modPath} => ${modBackupDst}\\ "
	pause 'Press [Enter] to confirm copy'
	cp -R  "${modPath}"  ${modBackupDst}"\\"
	echo "BACKUP UPDATED!"
}

main $1;



