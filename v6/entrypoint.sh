#!/bin/bash

# Debugging: Print current directory and environment variables
echo "Inside entrypoint.sh"
echo "Current directory: $(pwd)"
echo "Listing files in /app/biom3d:"
ls -la /app/biom3d
echo "Environment variables:"
env

# Ensure at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <python_module> [params...]"
    exit 1
fi

# Extract the Python module name
python_module="$1"
shift  # Remove the first argument to leave only the parameters

# Run the specified Python module with remaining parameters
exec python3.8 -m "$python_module" "$@"

