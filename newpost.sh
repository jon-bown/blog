#!/bin/bash
# This script creates a new Jekyll blog post with the current date and the provided title

# Change to the directory containing your _posts directory
cd ./_posts

# Get current date +1 day
date=$(date -v+1d +'%Y-%m-%d')

# Replace spaces in the title with dashes
title=$(echo $1 | tr ' ' '-')

# Create the new post file
filename="${date}-${title}.md"
touch "$filename"

# Add YAML front matter
echo "---" >> "$filename"
echo "layout: post" >> "$filename"
echo "title: \"$1\"" >> "$filename"
echo "description: \"\"" >> "$filename"
echo "date: ${date}" >> "$filename"
echo "---" >> "$filename"

echo "New post created with filename: ${filename}"
