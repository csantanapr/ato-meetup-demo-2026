# ATO Meetup Demo

## Prerequisites

- Kubernetes cluster with kubectl configured
- Helm 3.x installed
- GitHub Personal Access Token (for GitHub MCP server)

## Deploy Jaeger

Deploy Jaeger using Helm in the `jaeger` namespace:

```bash
# Add the Jaeger Helm repository
helm repo add jaegertracing https://jaegertracing.github.io/helm-charts
helm repo update

# Create namespace and install Jaeger
kubectl create namespace jaeger
helm install jaeger jaegertracing/jaeger -n jaeger
```

To access the Jaeger UI:

```bash
kubectl port-forward -n jaeger svc/jaeger-query 16686:16686
```

Then open http://localhost:16686 in your browser.

## Deploy MCP Servers

### GitHub MCP Server

1. Create a GitHub Personal Access Token:
   - Go to GitHub Settings → Developer settings → Personal access tokens → Tokens (classic)
   - Generate new token with appropriate scopes (repo, read:org, etc.)

2. Update the secret in `mcp-servers/github-mcp-server.yaml`:
   ```bash
   # Edit the file and replace 'your-github-token-here' with your actual token
   kubectl apply -f mcp-servers/github-mcp-server.yaml
   ```

### Kubernetes MCP Server

```bash
kubectl apply -f mcp-servers/kubernetes-mcp-server.yaml
```

### ArgoCD MCP Server

```bash
kubectl apply -f mcp-servers/argocd-mcp-server.yaml
```

### EKS MCP Server

```bash
kubectl apply -f mcp-servers/eks-mcp-server.yaml
```
