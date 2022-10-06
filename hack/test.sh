#!/bin/bash

CHART=${CHART:-"*"}
EXIT=0

for d in ${PWD}/charts/$CHART/; do
    /usr/bin/helm unittest --helm3 --color $d;
    CODE=`echo $?`
    if [ $CODE -ne 0 ]; then
        EXIT=$CODE
    fi
done

exit $EXIT
