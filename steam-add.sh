#!/bin/bash

# ini file
source ./steam-path.ini

# constants 
RED='\033[0;31m'
NC='\033[0m' # No Color

function main()
{
	local arg1=$1
	if [[ $arg1 == "--help" ]];
	then
		help_menu;
	elif [[ $arg1 == "" ]];
	then
		help_menu;		
	else
		steam_add ${arg1};
	fi	
	
}

function help_menu()
{
	echo "This is a script I created to help commit my skyrim mods on git."
	echo ""
	echo "Instructions:"
	echo "      A file with the same name as the mod must be created, and it"
	echo "    must contains all the files and directories the mod created. "
	echo "    and must ends with the extension .txt. Eg:"
	echo "    "
	echo "    ---------- myMod.txt ---------"
	echo "    myMod.esp"
	echo "    scripts/souce/helloWorld.psc"
	echo "    scripts/helloWorld.pex"
	echo "    ------------------------------"
	echo "    "
	echo "    Than, you must update the steam-path.ini file. Usually:"
	echo "    "
	echo "    ---------- steam-path.ini ---------"
	echo "    STEAM_DATA_PATH=\"C:\Program Files (x86)\Steam\steamapps\common\Skyrim\Data\""
	echo "    ------------------------------"
	echo "    "
	echo "      Once the .txt file is created, and the steam-path.ini updated,"
	echo "    you may use the script"
	echo ""
	echo "Usage:"
	echo "    mod-setup.sh <mod-name>"
	echo ""
	echo "Options:"
	echo "    --help: show this help menu"
	echo ""
}

function pause()
{
   read -p "$*"
}

function logOk()
{
	echo "  [OK]   ""$*";
}


function logNok()
{
	printf "  ${RED}[NOK]  ""$*"${NC}"\n";
}

# Copy a Single file from Steam instalation
function backup_file()
{
	local fileName=${1};
	local dstDir=${2};
	
	# check if args are empty
	if [ -z "$fileName" ]
	then
		logNok "\$fileName is empty";
		return 1;
	fi
	if [ -z "$dstDir" ]
	then
		logNok "\$dstDir is empty";
		return 1;
	fi	
	
	# check if steam data path exists
	if test -a "$STEAM_DATA_PATH"; then
		logOk "STEAM_DATA_PATH:$STEAM_DATA_PATH"
	else
		logNok "STEAM_DATA_PATH:$STEAM_DATA_PATH"
		return 1;
	fi
	
	local filePath=${STEAM_DATA_PATH}"\\"${fileName};
	local modBackupDst=".\\"${dstDir}"\\";
	
	# check if file exits
	if [ test -a "${filePath}" ]; 
	then
		logOk "filePath:${filePath}";
	else
		logNok "[NOK]  listed modfile filePath:${filePath}";
		return 2;
	fi	
	
	# create mod backup dir if does not exit
	if [ test -a "$modBackupDst" ]; 
	then
		logOk "modBackupDst:${modBackupDst}";
	else
		mkdir ${modBackupDst};
	fi		
	

	
	#do backup
	logOk "${filePath} => ${modBackupDst}\\"
	#cp -R "${filePath}" ${modBackupDst}"\\";
	install -D "${filePath}" ${modBackupDst}"\\"${fileName};
	return $?;
}

function steam_add()
{
	modName=${1};
	modFile=${modName}".txt";
	if [ test -a "$modFile" ]; 
	then
		logOk "modFile:$modFile";
	else
		logNok "modFile:${modFile} does not exit";
		return 1
	fi		

	# loop over all files listed on modFile.txt 
	myarray=(`cat ${modFile}`);
	noofelements=${#myarray[*]}
	#now traverse the array
	counter=0
	while [ $counter -lt $noofelements ]
	do
		local element=`echo ${myarray[$counter]} |sed "s/\r//g" `
		echo "-- Backup for element {$element}"
		backup_file ${element} ${modName}
		local ret=$?
		if [[ ${ret} != "0" ]]
		then
			logNok " ***ERROR*** ON backup_file() ret:${ret}"
			return 1;
		else 
			logOk "backup_file() ret=$?"
		fi
		counter=$(( $counter + 1 ))
	done
	
	echo "==> READY FOR git add ."
}

main ${1};



