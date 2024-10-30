#!/bin/bash

echo "🚀 Starting pull and setup for LLM-App..."

# Pull standard images from repositories
echo "⬇️ Pulling standard images..."

# Vector Database - Weaviate
podman pull semitechnologies/weaviate

# Document Database - MongoDB
podman pull mongo

# Relational Database - PostgreSQL
podman pull postgres

# Experiment Tracking - MLflow
podman pull mlflow/mlflow

# Metrics - Prometheus
podman pull prom/prometheus

# Monitoring - Grafana
podman pull grafana/grafana

# ELK Stack for Logging (Elasticsearch, Logstash, Kibana)
podman pull elasticsearch
podman pull logstash
podman pull kibana

echo "✅ Standard images pulled successfully."

# Check if secrets already exist in secret.yaml
echo "🔍 Checking for required secrets in secret.yaml..."

if grep -q "mongodbRootPassword" helm/ai-application/templates/secret.yaml; then
  echo "🔑 MongoDB password is set in secret.yaml."
else
  echo "⚠️  MongoDB password missing in secret.yaml. Please add it in base64-encoded format."
fi

if grep -q "postgresqlPassword" helm/ai-application/templates/secret.yaml; then
  echo "🔑 PostgreSQL password is set in secret.yaml."
else
  echo "⚠️  PostgreSQL password missing in secret.yaml. Please add it in base64-encoded format."
fi

if grep -q "weaviateApiKey" helm/ai-application/templates/secret.yaml; then
  echo "🔑 Weaviate API key is set in secret.yaml."
else
  echo "⚠️  Weaviate API key missing in secret.yaml. Please add it in base64-encoded format."
fi

# Additional secret checks can be added here as needed

echo "🎉 Pull and setup complete. You can now start each component individually with podman run commands or deploy the full application using Helm."
