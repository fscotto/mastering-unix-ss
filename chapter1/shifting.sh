#!/usr/bin/env bash
#
# SCRIPT: shifting.sh
# AUTHOR: Fabio Scotto di Santolo
# DATE:   28/07/2020
# REV:    1.1.A 
#
# PLATFORM: Not platform dependent
#
# PURPOSE: This script is used to process all of the tokens which
# are pointed to by the command-line arguments $1, $2, $3, etc...
#
# REV LIST:
#
##########################################################
#         DEFINE FILES AND VARIABLES HERE
##########################################################

total=0 # initialize the total counter to zero 

##########################################################
#               BEGINNING OF MAIN
##########################################################

# Start a while loop

for token in $*
do
    total=`expr $total + 1`  # A little math in the
                             # shell script, a running
                             # total of tokens processed.
    
    shift                    # Grab the next token, i.e. $2 become $1

done

echo "Total number of token processed: $total"
# End of script
