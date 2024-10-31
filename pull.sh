#!/bin/bash

echo "🚀 Starting pull and setup for LLM-App..."

# Pull standard images from repositories
echo "⬇️ Pulling standard images..."

# Experiment Tracking - MLflow
podman pull ghcr.io/mlflow/mlflow:latest

# Vector Database - Weaviate
podman pull semitechnologies/weaviate

# Document Database - MongoDB
podman pull mongo

# Relational Database - PostgreSQL
podman pull postgres

# Graph Database - Neo4j
podman pull neo4j:latest

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

# Check MongoDB credentials
if grep -q "mongodbRootPassword" helm/ai-application/templates/secret.yaml; then
  echo "🔑 MongoDB password is set in secret.yaml."
else
  echo "⚠️  MongoDB password missing in secret.yaml. Please add it in base64-encoded format."
fi

# Check PostgreSQL credentials
if grep -q "postgresqlPassword" helm/ai-application/templates/secret.yaml; then
  echo "🔑 PostgreSQL password is set in secret.yaml."
else
  echo "⚠️  PostgreSQL password missing in secret.yaml. Please add it in base64-encoded format."
fi

# Check Weaviate credentials
if grep -q "weaviateApiKey" helm/ai-application/templates/secret.yaml; then
  echo "🔑 Weaviate API key is set in secret.yaml."
else
  echo "⚠️  Weaviate API key missing in secret.yaml. Please add it in base64-encoded format."
fi

# Check Neo4j credentials
if grep -q "neo4jPassword" helm/ai-application/templates/secret.yaml; then
  echo "🔑 Neo4j password is set in secret.yaml."
else
  echo "⚠️  Neo4j password missing in secret.yaml. Please add it in base64-encoded format."
fi

# MLflow Tracking Password (if applicable)
if grep -q "mlflowTrackingPassword" helm/ai-application/templates/secret.yaml; then
  echo "🔑 MLflow tracking password is set in secret.yaml."
else
  echo "⚠️  MLflow tracking password missing in secret.yaml. Please add it in base64-encoded format."
fi

echo "🎉 Pull and setup complete. You can now start each component individually with podman run commands or deploy the full application using Helm."
