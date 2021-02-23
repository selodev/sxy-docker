#!/usr/bin/env bash

set -ea

if [ ! -f "package.json" ]; then
    echo "No package.json found at /usr/src/app."
else
    if [ ! -d "node_modules" ] || [ ! "$(ls -qAL node_modules 2>/dev/null)" ]; then
        echo "Node modules not installed."
        if [ "$NODE_ENV" = "development" ]; then
            # Install development dependencies.
            echo "Installing development dependencies..."
            npm install
        else
            # Install production dependencies.
            echo "Installing production dependencies..."
            npm install --only=production
        fi
    fi

    if [ "$NODE_ENV" = "development" ]; then
        # Develop Next
        echo "Developing Next app..."
        npm run dev
    else
        # Build and Start Next
        echo "Building Next app..."
        npm run build
        echo "Starting Next app..."
        npm run start
    fi

    echo "Started Next app..."
fi
# Execute the rest of your ENTRYPOINT and CMD as expected.
exec "$@"