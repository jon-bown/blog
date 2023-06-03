#!/bin/bash
# This script creates a new Jekyll blog post with the current date and the provided title

# Change to the directory containing your _posts directory
cd ./_posts

# Get current date
date=$(date +'%Y-%m-%d')

# Replace spaces in the title with dashes
title=$(echo $1 | tr ' ' '-')

# Create the new post file
touch "${date}-${title}.md"

# Add YAML front matter
echo "---" >> "${date}-${title}.md"
echo "layout: post" >> "${date}-${title}.md"
echo "title: \"$1\"" >> "${date}-${title}.md"
echo "date: ${date} ${time}" >> "${date}-${title}.md"
echo "---" >> "${date}-${title}.md"

echo "New post created with filename: ${date}-${title}.md"
