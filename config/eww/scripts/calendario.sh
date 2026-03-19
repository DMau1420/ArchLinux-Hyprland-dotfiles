#!/bin/bash

if [ -z "$2" ] || [ -z "$3" ]; then
	MONTH=$(date +%m)
	YEAR=$(date +%Y)
else
	MONTH=$2
	YEAR=$3
fi

case $1 in
	next_month)
		MONTH=$((MONTH + 1))
        	[ $MONTH -gt 12 ] && MONTH=1 && YEAR=$((YEAR + 1))
		;;
	prev_month)
		MONTH=$((MONT - 1))
		[ $MONTH -lt 1 ] && MONTH=12 && YEAR=$((YEAR - 1))
		;;
	next_year)
		YEAR=$((YEAR + 1))
		;;
	prev_year)
		YEAR=$((YEAR - 1))
		;;
esac

eww update current_month=$MONTH
eww update current_year=$YEAR
