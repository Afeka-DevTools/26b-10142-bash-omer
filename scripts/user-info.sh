#!/bin/bash

# Print info
echo "Current user: $(whoami)"
echo "Home directory: $HOME"
echo "Groups: $(groups | sed 's/ /, /g')" # comma-separated group list
echo "Shell: $SHELL"