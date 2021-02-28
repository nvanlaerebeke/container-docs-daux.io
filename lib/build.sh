#!/bin/bash
cd /source

if [ -d /source/docs ];
    echo "'docs' folder does not exist in /source"
    ls -l /source
    exit 1
fi

if [ -d /source/static ];
then
    echo "Removing old build..."
    rm -rf /source/static
fi

daux generate