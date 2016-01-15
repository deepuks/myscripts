#!/bin/bash
TMP_DIR=/tmp/lib_filter;
if [ -d "$TMP_DIR" ]; then
	rm -rf $TMP_DIR;
	mkdir -p $TMP_DIR;
else
	mkdir -p $TMP_DIR;
fi
TEMP_LIST=$TMP_DIR/list1
LIST_FILE=$TMP_DIR/list

if [ "$#" -ne 2 ]; then
	case "$1" in
	help|--help) echo "Usage : ./string_check.sh <absolute_path_of_exe/library> <string>";
	exit;
	;;
	*) echo "Usage : ./string_check.sh <absolute_path_of_exe/library> <string>";
	exit;
	;;
	esac
else

ldd $1 | awk '{print $3}' | sort -n | uniq > $TEMP_LIST
sed '/^\s*$/d' $TEMP_LIST | grep -v '(' > $LIST_FILE 
COUNT=`cat $LIST_FILE | wc -l`
i=1;
while [ $i -le $COUNT ]; do
	LIB=`cat $LIST_FILE | head -$i | tail -1`;
	strings $LIB | grep -i $2 ;
		if [ "$?" == "0" ]; then
			echo -e "$LIB Yes DK\n";
		else
			echo -e "$LIB No Boss\n";
		fi
sleep 0.5;
((i++));
done
fi

rm -rf $TMP_DIR
