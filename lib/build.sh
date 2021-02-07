#!/bin/bash
cd /source

if [ -d /source/static ];
then
    echo "Removing old build..."
    rm -rf /source/static
fi

daux generate