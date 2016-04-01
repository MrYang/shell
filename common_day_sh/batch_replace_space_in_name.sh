#!/bin/sh

find $1 -name "* *" |  
while read name
do
	new_name=$(echo $name | tr ' ' '_')
	mv "$name" $new_name
done