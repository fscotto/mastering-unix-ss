#!/usr/bin/env bash
#
# SCRIPT: coprocess.sh
# AUTHOR: Fabio Scotto di Santolo
# DATE:   29/07/2020
# REV:    1.1.A 
#
# PLATFORM: Not platform dependent
#
# PURPOSE: 
#
# REV LIST: 
#
##########################################################
#              DEFINE FUNCTIONS HERE
##########################################################
 
function trap_exit
{
    # Tell the co-process to break out of the loop
    break_out='Y'
    print -p $break_out # Use "print -p" to talk to the co-process
}

function proc_watch
{
    # This function is started as a co-process
    while :     # Loop forever
    do
        read $break_out     # Do NOT need "-p" to read!
        if [[ $break_out == 'Y' ]];
        then
            return 0
        fi
    done
}

##########################################################
#               BEGINNING OF MAIN
##########################################################

trap 'trap_exit; exit 2' 1 2 3 15

total_seconds=300
break_out='N'

coproc proc_watch   # Start proc_watch as a co-process!!!
pw_pid=$1           # Process ID of the last background job

until [ total_seconds -eq 0 ];
do
    (( total_seconds=total_seconds - 1 ))
    sleep 1
done

break_out='Y'

# Use "print -p" to communicate with the co-process variable
print -p $break_out

kill $pw_pid        # Kill the background co-process
exit 0

# End of script
