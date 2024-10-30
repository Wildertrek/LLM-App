#!/bin/bash

# Create Helm chart and templates directory structure
mkdir -p helm/ai-application/templates

# Basic Helm chart files
touch helm/ai-application/Chart.yaml
touch helm/ai-application/values.yaml

# Frontend (Next.js)
touch helm/ai-application/templates/deployment-frontend.yaml
touch helm/ai-application/templates/service-frontend.yaml

# Backend API (FastAPI)
touch helm/ai-application/templates/deployment-backend.yaml
touch helm/ai-application/templates/service-backend.yaml

# LLM Agents
touch helm/ai-application/templates/deployment-llm-agents.yaml
touch helm/ai-application/templates/service-llm-agents.yaml

# Vector Database (Weaviate)
touch helm/ai-application/templates/deployment-weaviate.yaml
touch helm/ai-application/templates/service-weaviate.yaml

# Document Database (MongoDB)
touch helm/ai-application/templates/deployment-mongodb.yaml
touch helm/ai-application/templates/service-mongodb.yaml

# Relational Database (PostgreSQL)
touch helm/ai-application/templates/deployment-postgresql.yaml
touch helm/ai-application/templates/service-postgresql.yaml

# MLflow Experiment Tracking
touch helm/ai-application/templates/deployment-mlflow.yaml
touch helm/ai-application/templates/service-mlflow.yaml

# Observability and Monitoring
touch helm/ai-application/templates/deployment-prometheus.yaml
touch helm/ai-application/templates/service-prometheus.yaml
touch helm/ai-application/templates/deployment-grafana.yaml
touch helm/ai-application/templates/service-grafana.yaml
touch helm/ai-application/templates/deployment-elasticsearch.yaml
touch helm/ai-application/templates/service-elasticsearch.yaml
touch helm/ai-application/templates/deployment-logstash.yaml
touch helm/ai-application/templates/service-logstash.yaml
touch helm/ai-application/templates/deployment-kibana.yaml
touch helm/ai-application/templates/service-kibana.yaml

# Configurations and Secrets
touch helm/ai-application/templates/configmap.yaml
touch helm/ai-application/templates/secret.yaml

echo "Setup complete: All initial files have been created."

