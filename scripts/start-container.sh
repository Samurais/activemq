#! /bin/bash 
###########################################
#
###########################################

# constants
baseDir=$(cd `dirname "$0"`;pwd)
LOG_DIR=$baseDir/../log
DATA_DIR=$baseDir/../data
# functions

# main 
[ -z "${BASH_SOURCE[0]}" -o "${BASH_SOURCE[0]}" = "$0" ] || return
cd $baseDir/..
docker run --name='activemq' -it --rm \
        -p 8161:8161 \
        -p 61616:61616 \
        -p 61613:61613 \
        -e 'ACTIVEMQ_MIN_MEMORY=512' \
        -e 'ACTIVEMQ_MAX_MEMORY=2048'\
        -v $DATA_DIR:/data/activemq \
        -v $LOG_DIR:/var/log/activemq \
        -P webcenter/activemq:latest \
