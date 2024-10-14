#!/bin/bash

# Verify if the number of parameters is correct
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <python_module> <params...>"
    exit 1
fi

# Extract the Python module name
python_module="$1"
shift  # Remove the first argument to leave only the parameters

# Extract the remaining parameters
params="$@"

# Define the Docker image name
docker_image="biom3d_cuda"

# Debugging: Print current directory and list files
echo "Current directory: $(pwd)"
echo "Listing files in current directory:"
ls -la

# Run Docker container with increased shared memory size and provided parameters
docker run --rm --shm-size=1g $docker_image "$python_module" $params

