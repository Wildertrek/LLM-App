# AI Application on OpenShift

## Overview
This project is an AI application hosted on OpenShift, designed to offer flexible, scalable LLM interactions via a web interface. We’ve integrated multiple databases and advanced tooling, including LangChain and LangGraph, to manage an agent-based system for document processing and Retrieval-Augmented Generation (RAG) workflows.

## Project Structure
```plaintext
LLM-App/
├── README.md                # Project overview and setup instructions
├── helm/                    # Helm chart for deploying components on OpenShift
│   └── ai-application/      # Helm chart folder for AI application
│       ├── Chart.yaml       # Helm chart metadata
│       ├── values.yaml      # Default configuration values for all components
│       └── templates/       # Kubernetes resource templates
│           ├── configmap.yaml              # ConfigMap for environment variables
│           ├── secret.yaml                 # Secrets for sensitive information
│           ├── deployment-backend.yaml     # Deployment for Backend (FastAPI)
│           ├── deployment-frontend.yaml    # Deployment for Frontend (Next.js)
│           ├── deployment-llm-agents.yaml  # Deployment for LLM Agents
│           ├── deployment-weaviate.yaml    # Deployment for Vector Database (Weaviate)
│           ├── deployment-mongodb.yaml     # Deployment for Document Database (MongoDB)
│           ├── deployment-postgresql.yaml  # Deployment for Relational Database (PostgreSQL)
│           ├── deployment-mlflow.yaml      # Deployment for Experiment Tracking (MLflow)
│           ├── deployment-prometheus.yaml  # Deployment for Metrics (Prometheus)
│           ├── deployment-grafana.yaml     # Deployment for Monitoring (Grafana)
│           ├── deployment-elasticsearch.yaml # Deployment for Log Management (Elasticsearch)
│           ├── deployment-logstash.yaml    # Deployment for Log Ingestion (Logstash)
│           ├── deployment-kibana.yaml      # Deployment for Log Visualization (Kibana)
│           ├── service-backend.yaml        # Service for Backend API
│           ├── service-frontend.yaml       # Service for Frontend
│           ├── service-llm-agents.yaml     # Service for LLM Agents
│           ├── service-weaviate.yaml       # Service for Vector Database
│           ├── service-mongodb.yaml        # Service for Document Database
│           ├── service-postgresql.yaml     # Service for Relational Database
│           ├── service-mlflow.yaml         # Service for Experiment Tracking
│           ├── service-prometheus.yaml     # Service for Prometheus
│           ├── service-grafana.yaml        # Service for Grafana
│           ├── service-elasticsearch.yaml  # Service for Elasticsearch
│           ├── service-logstash.yaml       # Service for Logstash
│           └── service-kibana.yaml         # Service for Kibana
├── setup.sh                # Script to initialize Helm files and project structure
└── src/                    # Source code for backend and frontend services
    ├── frontend/           # Next.js frontend code for user interaction
    ├── backend/            # FastAPI backend code for handling API requests
    └── agents/             # Code for LLM Agents using LangChain and LangGraph

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

### **AI Application (LLM-App) Architecture Overview**

1. **Frontend (User Interface)**
   - **Technology**: **Next.js**
   - **Purpose**: Provides the user interface for interacting with the application. Users can submit queries, view LLM responses, and interact with other data-driven features.
   - **Deployment**: Deployed as a separate service managed by Helm.
   - **Connection**: 
     - Communicates with the **Backend API** to send user inputs and retrieve responses.
     - Configured to handle secure communication through HTTPS.

2. **Backend API**
   - **Technology**: **FastAPI**
   - **Purpose**: Serves as the core API layer, managing user requests, processing workflows, and integrating with the AI and database components. This is where most business logic, such as data parsing and LLM invocation, resides.
   - **Deployment**: Deployed as a separate service, containerized and managed via Helm.
   - **Connection**: 
     - Connects to the **Frontend** for sending and receiving user data.
     - Manages interactions with the **LLM Agents** and **Databases** for retrieval-augmented generation (RAG) and other workflows.
     - Secured through API keys or token-based authentication.

3. **Large Language Model (LLM) Agents**
   - **Technology**: **LangChain** and **LangGraph**
   - **Purpose**: Manages multi-step workflows, breaking down complex user requests, and integrating various LLMs based on the use case.
   - **Deployment**: Packaged with the backend or as a microservice (depending on resource requirements).
   - **Components**:
     - **Primary LLMs**: Integrates **OpenAI API** for general-purpose LLM use and **Hugging Face Transformers** for specialized or local models.
     - **Agent Tasks**: Includes document parsing, chunking, embedding creation, and response generation.
   - **Connection**: 
     - Invoked by the **Backend API** to process user inputs, retrieve data from the **Vector Database**, and generate responses.
     - Utilizes **LangGraph** to manage conversation memory and entity relationships.

4. **Vector Database (for Embeddings)**
   - **Technology**: **Weaviate**
   - **Purpose**: Stores vector embeddings for fast similarity-based retrieval. Essential for the RAG pipeline, as it allows for quick access to relevant information chunks in response to user queries.
   - **Deployment**: Deployed as a standalone service with its own Helm configuration.
   - **Connection**:
     - Connects to the **Backend API** for embedding storage and retrieval.
     - Works with **LLM Agents** to store or retrieve embeddings based on document parsing results.

5. **Document Database (for Semi-Structured Data)**
   - **Technology**: **MongoDB**
   - **Purpose**: Manages semi-structured data, such as processed documents and user interactions that don’t fit in a relational database.
   - **Deployment**: Deployed as a separate service, configured with a Helm chart.
   - **Connection**:
     - Connects to the **Backend API** for read and write operations.
     - Stores raw or parsed documents used in RAG pipelines.

6. **Relational Database (for Structured Data)**
   - **Technology**: **PostgreSQL**
   - **Purpose**: Manages structured data, such as metadata, user profiles, and system configurations, supporting relational queries and transactional data.
   - **Deployment**: Deployed as a standalone service using Helm.
   - **Connection**:
     - Interacts with the **Backend API** for relational data retrieval and updates.
     - Stores metadata for documents, user actions, and LLM configurations.

7. **Experiment Tracking and Model Management**
   - **Technology**: **MLflow**
   - **Purpose**: Tracks model experiments, metadata, and performance metrics for the LLMs and other models used in the application.
   - **Deployment**: Optional deployment, managed as a standalone Helm service or integrated into the Backend if lightweight.
   - **Connection**:
     - Connects with **Backend API** to log experiments, track versions, and manage model lifecycles.
     - Can integrate with **LangChain** for advanced model versioning and testing.

8. **Authentication & Security**
   - **Technology**: **Auth0**
   - **Purpose**: Manages user authentication and secure access to the API and application.
   - **Deployment**: Integrated with the Backend API for secure user authentication.
   - **Connection**:
     - Secures access between the **Frontend** and **Backend API**.
     - Manages user roles and permissions for different application features.

9. **Observability and Monitoring**
   - **Technology**: **Prometheus + Grafana** (for metrics) and **ELK Stack** (for logs)
   - **Purpose**: Provides logging, monitoring, and visualization for application health, resource usage, and performance.
   - **Deployment**: Separate Helm deployments for observability components.
   - **Connection**:
     - Collects logs and metrics from **Backend API**, **LLM Agents**, and **Databases**.
     - Sends alerts based on defined thresholds for resource or error monitoring.

---

### **Flow of Data and Connections**

1. **User Interaction**:
   - Users interact with the **Frontend (Next.js)**, sending queries or commands that the frontend passes to the **Backend API**.

2. **Backend Processing**:
   - The **Backend API** handles the request and invokes the **LLM Agents** for any required parsing, embeddings, or LLM responses.
   - The **LLM Agents** use **LangChain** and **LangGraph** to manage multi-step workflows, retrieve embeddings from **Weaviate**, and, if needed, request data from **MongoDB** or **PostgreSQL**.

3. **RAG Pipeline Execution**:
   - For RAG tasks, **LLM Agents** retrieve relevant embeddings from the **Vector Database (Weaviate)** and use these to provide context to the LLMs, improving response relevance.
   - Processed responses are sent back through the **Backend API** to the **Frontend**.

4. **Data Storage and Experiment Tracking**:
   - **MongoDB** and **PostgreSQL** store semi-structured and structured data, respectively, keeping records of user interactions, processed documents, and metadata.
   - **MLflow** tracks model experiments and performance, managed either by the **Backend API** or via direct logging from **LLM Agents**.

5. **Security and Observability**:
   - **Auth0** secures user sessions, verifying access before any frontend-to-backend interaction.
   - **Prometheus + Grafana** and **ELK Stack** collect and monitor metrics and logs, ensuring system health and providing insights into application performance.

This architecture establishes a clear pathway for modular, scalable interactions, allowing you to add new components or extend functionality as needed. Each component has a well-defined role, and the Helm-based deployments facilitate straightforward management and scaling in OpenShift.

---

## Technology Stack

### **Frontend**
- **Framework**: **Next.js** – for the user interface, providing server-side rendering and interactivity.

### **Backend API**
- **Framework**: **FastAPI** – handles user requests, processes workflows, and orchestrates interactions with other components.

### **Large Language Model (LLM) Agents**
- **Frameworks**:
  - **LangChain** – for managing agent-based workflows and multi-step tasks.
  - **LangGraph** – for handling conversation memory, entity relationships, and complex query management.
- **LLM Integrations**:
  - **OpenAI API** – for general-purpose LLM interactions.
  - **Hugging Face Transformers** – for specialized or local LLM models.

### **Databases**
1. **Vector Database**:
   - **Weaviate** – stores vector embeddings for similarity-based retrieval in the RAG pipeline.

2. **Document Database**:
   - **MongoDB** – manages semi-structured data like processed documents and user interactions.

3. **Relational Database**:
   - **PostgreSQL** – stores structured data, including metadata, user profiles, and configurations.

### **Experiment Tracking and Model Management**
- **Tool**: **MLflow** – tracks model experiments, versioning, and performance metrics.

### **Authentication & Security**
- **Tool**: **Auth0** – manages secure user authentication and API access.

### **Observability and Monitoring**
1. **Metrics**:
   - **Prometheus** – collects system metrics for performance monitoring.
   - **Grafana** – visualizes metrics and creates monitoring dashboards.

2. **Logging**:
   - **ELK Stack** (Elasticsearch, Logstash, Kibana) – aggregates and searches logs for debugging and error tracking.

---

Each of these components will be containerized and deployed in OpenShift using **Helm** for scalable, modular management. This technology stack provides a comprehensive setup for developing, managing, and scaling the application. 


Here’s the streamlined list of technologies for your **LLM-App** AI application:

---

- **Frontend** - Framework: **Next.js**
- **Backend API** - Framework: **FastAPI**

- **LLM Agents**:
  - Workflow Management: **LangChain**
  - Context and Memory Handling: **LangGraph**
  - LLM Integrations: **OpenAI API**, **Hugging Face Transformers**

- **Vector Database** - Database: **Weaviate**
- **Document Database** - Database: **MongoDB**
- **Relational Database** - Database: **PostgreSQL**

- **Experiment Tracking and Model Management** - Tool: **MLflow**

- **Authentication & Security** - Tool: **Auth0**

- **Observability and Monitoring**:
  - Metrics: **Prometheus** and **Grafana**
  - Logging: **ELK Stack** (Elasticsearch, Logstash, Kibana)

---
