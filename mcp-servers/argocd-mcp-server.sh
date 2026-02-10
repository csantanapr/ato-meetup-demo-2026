#!/bin/bash

#create kubernetes secret argocd-mcp-secret with ARGOCD_API_TOKEN variable

kubectl create secret generic argocd-mcp-secret \
  --from-literal=ARGOCD_API_TOKEN=$ARGOCD_API_TOKEN \
  -n kagent
