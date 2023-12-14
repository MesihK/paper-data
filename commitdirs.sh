#!/bin/bash

# Directory containing the files
DIR="rbh"

# Change to the target directory
cd "$DIR"

for folder in */; do
    # Ensure it's a directory
    if [ -d "$folder" ]; then
        echo "Folder: $folder"
        cd $folder
        git add .
        git commit -m "[RBH] add $folder"
        cd ..
    fi
done

