#!/bin/bash

# Directory containing the files
DIR="rbh"

# Change to the target directory
cd "$DIR"

# Iterate over all files
for file in *; do
    if [ -f "$file" ]; then  # Check if it's a file
        # Extract the first two characters of the filename
        prefix=$(echo "$file" | cut -c 1-2)

        # Create a directory with the prefix, if it doesn't exist
        mkdir -p "$prefix"

        # Move the file to the corresponding directory
        mv "$file" "$prefix/"
    fi
done

# List number of files and total size for each subfolder
for folder in */; do
    # Ensure it's a directory
    if [ -d "$folder" ]; then
        echo "Folder: $folder"
        # Count number of files
        num_files=$(find "$folder" -type f | wc -l)
        echo "Number of files: $num_files"
        # Calculate total size
        total_size=$(du -sh "$folder" | cut -f1)
        echo "Total size: $total_size"
        echo ""
    fi
done

