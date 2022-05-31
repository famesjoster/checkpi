#!/bin/bash

TARGET=$1

if [[ ! -z $TARGET ]]; then
        fping -RAl -p100 $TARGET
else
        fping -RAl -p100 209.18.47.61
fi
