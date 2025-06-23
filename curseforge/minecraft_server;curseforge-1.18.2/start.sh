#!/bin/bash

# Accept EULA if not already present
if [ ! -f eula.txt ]; then
  echo "eula=true" > eula.txt
fi

# Make sure run.sh is executable
chmod +x run.sh

# Launch using Forge's provided script
./run.sh nogui