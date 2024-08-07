#!/bin/bash

# If the ~/.ssh directory doesn't exist, create it
if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
fi

# Install the SSH key
echo "${AWS_CNET204_KEY}" > ~/.ssh/id_rsa

# Set the permissions
chmod 600 ~/.ssh/id_rsa

# Add the SSH key to the SSH agent
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "AWS SSH key has been added to your Codespace."