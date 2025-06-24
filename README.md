## Liquibase Project
**As a database** engineer, **I want to** automate deployment of database changes, **So that** I can ensure consistent, traceable, and controlled database schema changes across development, staging, and production environments.

### 1. Pipeline Flow Summary

#### 📦Continuos Integration 
```
CI Pipeline (is this code valid and buildable)
│
├── Validate Changelog
├── Show Pending Changes
├── Generate SQL Preview
├── Generate Rollback SQL
├── Deploy to Dev
├── Tag Database
├── Geberate Build Metadat
├── Build Artifacts
└── 📦 Publish Artifact:
    ├── changelog.xml
    ├── /scripts/*.sql
    ├── update-preview.sql
    ├── rollback-preview.sql
    ├── version.txt
    └── liquibase.properties (optional)
```

#### 🚀 Continous Delivery
```
CD Pipeline (is this safe to deploy)
│
├── Triggered by CI
├── Downloads CI artifact
├── Deploys to staging/prod using changelog
└── References version/tag for auditing
```

### 2. Project Structure
```
liquibase-project/            
├── changelog.xml
├── sql/
│   ├── create_tables_emp.sql
│   └── drop_table_emp.sql
├── azure-ci-pipelines.yml
├── azure-cd-pipelines.yml
├── variables.yml
├── LICENSE
├── liquibase.properties
├── CHANGELOG.md
└── README.md
```