#!/bin/sh

#returns all the passed arguments

all_args="$*"

echo "$all_args" | cut -d ' ' -f "$#"
