# AI Application on OpenShift

## Overview
This project is an AI application hosted on OpenShift, designed to offer flexible, scalable LLM interactions via a web interface. We’ve integrated multiple databases and advanced tooling, including LangChain and LangGraph, to manage an agent-based system for document processing and Retrieval-Augmented Generation (RAG) workflows.

## Project Structure
```plaintext
├── helm/
│   ├── charts/           # Helm charts for deploying components
├── src/
│   ├── api/              # API code for LLM and agent interactions
│   ├── frontend/         # Web interface for user interaction
├── db/
│   ├── vector/           # Scripts for Weaviate setup and maintenance
│   └── other_db/         # Scripts for MongoDB and PostgreSQL setup
└── docs/                 # Documentation and setup guides
```

## Tech Stack and Component Choices

### Frontend
- **Framework**: **Next.js**
  - Utilized for its server-side rendering, enhancing performance and scalability for an interactive user interface.

### Backend
- **Framework**: **FastAPI**
  - Chosen for its high performance and asynchronous capabilities, ideal for handling multiple concurrent LLM requests.

### Large Language Models (LLMs)
- **Integrations**: **OpenAI API** for general-purpose LLM use; **Hugging Face Transformers** for specialized or local models.
  - This dual approach allows flexibility for various tasks and privacy considerations.

### Databases
- **Vector Database**: **Weaviate**
  - Selected for storing embeddings, crucial for efficient document retrieval in the RAG pipeline.
- **Document Database**: **MongoDB**
  - Manages semi-structured data, offering robust document storage with indexing.
- **Relational Database**: **PostgreSQL**
  - Stores structured data, supporting relational integrity for AI application metadata.

### Experiment Tracking and Model Management
- **Tool**: **MLflow**
  - Tracks experiments, stores metadata, and supports lifecycle management of ML models.

### Agents
- **Primary Framework**: **LangChain**
  - Used to create, manage, and orchestrate agents for multi-step tasks and agent-based workflows.
- **Enhanced Workflow**: **LangGraph**
  - For context management and graph-based workflows, enabling more complex query handling and conversation memory.

### Authentication & Security
- **Tool**: **Auth0**
  - Provides secure, managed authentication with support for multiple identity providers.

### Observability and Monitoring
- **Metrics**: **Prometheus + Grafana**
  - Tracks time-series metrics for system performance and resource monitoring.
- **Logging**: **ELK Stack**
  - Manages log aggregation and search, facilitating debugging and monitoring.

### CI/CD Pipeline
- **Tool**: **GitHub Actions**
  - Integrates CI/CD with GitHub, automating testing, linting, and OpenShift deployment.

---

## Getting Started

1. **Clone the Repository**
   ```bash
   git clone <repository-url>
   cd <repository-name>
   ```

2. **Configure Environment Variables**
   - Use OpenShift ConfigMaps and Secrets to manage sensitive information like API keys and database URIs.

3. **Deploying with Helm**
   - Deploy each service independently for scalability:
     ```bash
     helm install <release-name> ./helm/charts/<component>
     ```

## Core Components

1. **Web Interface** (Next.js)
   - A responsive web UI allowing users to interact with the LLMs and view results in real-time.

2. **API Service** (FastAPI)
   - Manages LLM interactions, task orchestration, and document processing workflows.

3. **Agent System** (LangChain and LangGraph)
   - **Data Processing Agents**: Parse and chunk documents for RAG.
   - **Embedding Agent**: Creates and stores embeddings in Weaviate.
   - **Retrieval Agent**: Queries Weaviate, retrieves documents, and generates responses.
   - **Memory and Context Management**: LangGraph manages conversation history and complex queries.

4. **Database Layer**
   - **Vector Database** (Weaviate): Stores embeddings for RAG.
   - **Document Storage** (MongoDB): Manages semi-structured document data.
   - **Relational Data** (PostgreSQL): Stores structured metadata and configurations.

5. **Experiment Tracking** (MLflow)
   - Tracks model and experiment metadata, enhancing reproducibility.

6. **Authentication & Security** (Auth0)
   - Manages secure user login, permissions, and role-based access control.

7. **Observability and Monitoring**
   - **Prometheus + Grafana**: Tracks and visualizes performance metrics.
   - **ELK Stack**: Aggregates logs, enabling streamlined error tracking.

---

## Contributing

- **Branching**: Use feature branches and submit pull requests for code changes.
- **CI/CD**: GitHub Actions handle testing and deployment to OpenShift on merge.

## Roadmap

- Expand LLM capabilities by integrating additional specialized models.
- Enhance web interface for improved usability and interaction with agents.
- Increase agent functionality with advanced workflows and custom tool integrations.

---

