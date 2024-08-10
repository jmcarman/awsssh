#!/bin/bash
# Author:        Jason Carman; jasonmcarman@gmail.com
# Date:     August 5, 2024
# Purpose:        Install an SSH key into the GitHub Codespaces container
# Usage:        Add this file or the contents of it to the .devcontainer directory in your repository
# License:        Apache 2.0
# Link:        https://www.apache.org/licenses/LICENSE-2.0
#

# If the ~/.ssh directory doesn't exist, create it
if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
fi

# Install the SSH key
echo "${SSH_KEY}" > ~/.ssh/id_rsa

# Set the permissions
chmod 600 ~/.ssh/id_rsa

# Add the SSH key to the SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "SSH key has been installed and added to the SSH agent"