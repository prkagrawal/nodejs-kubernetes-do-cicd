#!/bin/bash

COMMIT_SHA1=$1

# Define the desired commit SHA value
NEW_COMMIT_SHA=$COMMIT_SHA1

# Export the commit SHA as an environment variable
export COMMIT_SHA1="$NEW_COMMIT_SHA"

# Use envsubst to replace the placeholder in the Deployment YAML file
envsubst '$COMMIT_SHA1' < k8s/deployment.yaml > temp.yaml && mv temp.yaml k8s/deployment.yaml