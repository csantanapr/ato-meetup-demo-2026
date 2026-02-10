#!/bin/bash

#create kubernetes secret github-mcp-secret with GITHUB_PERSONAL_ACCESS_TOKEN variable

kubectl create secret generic github-mcp-secret \
  --from-literal=GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN \
  -n mcp
