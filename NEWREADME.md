# LLM-App

LLM-App is an AI application designed to interact with large language models (LLMs) and manage various services for data processing, storage, monitoring, and logging. This project leverages Helm for Kubernetes deployment and includes configurations for multiple components including backend APIs, frontend interface, databases, vector storage, and monitoring tools.

## Project Structure

```plaintext
├── README.md                        # Project overview and instructions
├── helm/
│   └── ai-application/              # Helm chart directory for the AI application
│       ├── Chart.yaml               # Helm chart configuration file
│       ├── templates/               # Kubernetes YAML templates for deploying components
│       │   ├── configmap.yaml             # Configuration map for environment variables
│       │   ├── deployment-backend.yaml    # Deployment config for backend API
│       │   ├── deployment-elasticsearch.yaml  # Deployment config for Elasticsearch
│       │   ├── deployment-frontend.yaml   # Deployment config for frontend interface
│       │   ├── deployment-grafana.yaml    # Deployment config for Grafana
│       │   ├── deployment-kibana.yaml     # Deployment config for Kibana
│       │   ├── deployment-llm-agents.yaml # Deployment config for LLM agents
│       │   ├── deployment-logstash.yaml   # Deployment config for Logstash
│       │   ├── deployment-mlflow.yaml     # Deployment config for MLflow
│       │   ├── deployment-mongodb.yaml    # Deployment config for MongoDB
│       │   ├── deployment-postgresql.yaml # Deployment config for PostgreSQL
│       │   ├── deployment-prometheus.yaml # Deployment config for Prometheus
│       │   ├── deployment-weaviate.yaml   # Deployment config for Weaviate (vector DB)
│       │   ├── logstash-config.yaml       # ConfigMap for Logstash configuration
│       │   ├── logstash-pipeline.yaml     # ConfigMap for Logstash pipeline setup
│       │   ├── pvc-elasticsearch.yaml     # PersistentVolumeClaim for Elasticsearch
│       │   ├── pvc-mlflow-artifacts.yaml  # PersistentVolumeClaim for MLflow artifacts
│       │   ├── pvc-mongo.yaml             # PersistentVolumeClaim for MongoDB
│       │   ├── secret-example.yaml        # Example secrets file for secure credentials
│       │   ├── secret.yaml                # Secrets file for storing sensitive data
│       │   ├── service-backend.yaml       # Service config for backend API
│       │   ├── service-elasticsearch.yaml # Service config for Elasticsearch
│       │   ├── service-frontend.yaml      # Service config for frontend interface
│       │   ├── service-grafana.yaml       # Service config for Grafana
│       │   ├── service-kibana.yaml        # Service config for Kibana
│       │   ├── service-llm-agents.yaml    # Service config for LLM agents
│       │   ├── service-logstash.yaml      # Service config for Logstash
│       │   ├── service-mlflow.yaml        # Service config for MLflow
│       │   ├── service-mongodb.yaml       # Service config for MongoDB
│       │   ├── service-postgresql.yaml    # Service config for PostgreSQL
│       │   ├── service-prometheus.yaml    # Service config for Prometheus
│       │   └── service-weaviate.yaml      # Service config for Weaviate
│       └── values.yaml               # Helm values file for configuration
└── setup.sh                         # Script for setting up the project and dependencies
```

## Setup Instructions

1. **Clone the Repository**: Clone this repository to your local environment.
   ```bash
   git clone https://github.com/Wildertrek/LLM-App.git
   cd LLM-App
   ```

2. **Configure Secrets**: Update `secret.yaml` with base64-encoded credentials for secure variables. Use `secret-example.yaml` as a reference template. Make sure `secret.yaml` is added to `.gitignore` to prevent sensitive information from being committed.

3. **Run Setup Script**: Execute `setup.sh` to initialize the directory structure and set up the Kubernetes environment.

4. **Deploy with Helm**:
   - Make sure Helm is installed and initialized.
   - Deploy the Helm chart to your Kubernetes cluster:
     ```bash
     helm install llm-app ./helm/ai-application
     ```

## Components

- **Backend API**: FastAPI backend to handle API requests for LLM interactions.
- **Frontend Interface**: Next.js frontend to provide a user interface.
- **Elasticsearch, Logstash, and Kibana (ELK Stack)**: For logging and visualization.
- **Grafana and Prometheus**: For monitoring metrics and performance.
- **MLflow**: For managing machine learning experiments and model metadata.
- **MongoDB and PostgreSQL**: Document and relational databases for data storage.
- **Weaviate**: Vector database used in the RAG pipeline for storing and retrieving embeddings.
- **LLM Agents**: Agents to interact with LLM APIs like OpenAI and Anthropic.

## Configuration

- **configmap.yaml**: Stores environment-specific configurations and URLs.
- **values.yaml**: Centralized configuration for deployment, enabling easy customization of replica counts, image versions, and resource limits.

## Security

- **Secrets**: Sensitive information is stored in `secret.yaml`, with an example provided in `secret-example.yaml`. All sensitive data, such as API keys and database credentials, should be base64-encoded.

## Deployment and Scaling

- The deployment templates support scaling by adjusting replica counts in `values.yaml`.
- Services can be configured for internal or external access by modifying `ClusterIP`, `NodePort`, or `LoadBalancer` settings in the respective service files.

## Monitoring and Logging

- **Prometheus** and **Grafana** are used for monitoring system metrics.
- **Elasticsearch**, **Logstash**, and **Kibana** (ELK stack) provide a full-featured logging solution, helping you monitor and troubleshoot the application in real-time.

## Additional Information

- **Persistent Volume Claims (PVCs)**: Ensure data persistence for key components like MongoDB, Elasticsearch, and MLflow.
- **LLM Interaction**: LLM agents are configured to interact with multiple large language model providers, including OpenAI and Anthropic.

## License

This project is licensed under the MIT License.
```
