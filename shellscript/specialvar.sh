#!/bin/bash

$1, $2, $3 
echo "All variables passed: $@"
echo "No.of variables: $#"
echo "Current script name: $0"
echo "Present working dire: $PWD"
echo "Home directory of current user: $HOME"
echo "Which user running the script: $USER"
echo "Process id of current script: $$"
sleep 60 & #--> & to run in background
echo "Process id of last command in background: $!"
echo "to store the exit status of last command: $?"


