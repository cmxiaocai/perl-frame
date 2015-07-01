#!/bin/bash

if [ $# -eq 0 ]
then
	echo "No specified parameter"
	exit 0;
fi

if [ ! -f "application/$1.pl" ]; then 
	echo "<$1> not exist"
	exit 0;
fi 

ENVIRONMENT=product
if [ $# -eq 2 ]
then
	ENVIRONMENT=$2
fi

# /usr/bin/prel 
result=`
export PERL5LIB=$PERL5LIB:package
perl application/$1.pl $ENVIRONMENT
`
echo $result

# insert log
current_date=`date ""+%Y%m%d`
todaylog="log/shell_result/${current_date}.log"
if [ ! -f $todaylog ]
then
	touch $todaylog
fi
log_time_format=`date "+%Y-%m-%d %T"`
echo "${log_time_format} [perl application/$1.pl $ENVIRONMENT]::$result">>${todaylog}

