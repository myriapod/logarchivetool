#!/bin/bash

# log-archive tool
# written on 10/09/2024

# Get the log directory from the command line 
# If no argument is passed
if [ -z "$1" ]; then echo "A log directory to compress has to be passed as an argument."; exit; fi

# Define the log_directory as the first argument passed
log_directory=$1
# Checking if the requested log directory exists / is a directory
if [ ! -d $log_directory ]; then
    echo "The log directory to compress don't exist."
    exit
fi

# Define the compressed_directory as the first argument passed
compressed_directory=$2
# If there is no second argument passed, use the default compressed cirectory
if [ -z "$2" ]; then compressed_directory=/var/log/logs_compressed; fi

# If the compressed directory doesn't exist yet, create it
if [ ! -d $compressed_directory ]; then
    mkdir $compressed_directory && echo "The compressed logs can be found in $compressed_directory" || echo "Something went wrong in creating $compressed_directory"
fi

# Compressing the logs from logs_directory to the compressed_directory
tar cf $compressed_directory/logs_archive_$(date +%Y%m%d)_$(date +%H%M%S).tar.gz $log_directory

# Supressing the archived logs
rm -rf $log_directory && echo "The directory $log_directory has been removed" || echo "Something went wrong in removing $log_directory"