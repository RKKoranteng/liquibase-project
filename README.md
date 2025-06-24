## Liquibase Project
**As a database** engineer, **I want to** automate deployment of database changes, **So that** I can ensure consistent, traceable, and controlled database schema changes across development, staging, and production environments.

- [1. Quickstart](#1-Quickstart)
- [2. Project Structure](#2-Project-Structure)
- [3. Pipeline Flow Summary](#3-Pipeline-Flow-Summary)

### 1. Quickstart
#### 1.1. Pre-reqs
- Azure DevOps organization and project
- Git repo to hold your changeset and Liquibase project
- Oracle database (Dev, Staging, Prod) accessible from agent
- Azure DevOps agents with:
    - Java 8+
    - Liquibase installed
    - sqlplus installed (for Oracle access)

#### 1.2. Setup Project
- Use the following command to clone the latest release of the project: 
`git clone https://github.com/RKKoranteng/liquibase-project.git`
- Go to your Azure DevOps project ➝ Environments ➝ New Environment
  - Create `staging` environment
  - Create `prod` environment

#### 1.3. Create CI Pipeline
- Create CI pipeline in Azure DevOps. Use Exising Azure Pipelines YAML file `azure-ci-pipelines.yml`
- Secure Azure DevOps credentials: `usersname` and `password`
- Define environment-specific variables in `variables.yml`

#### 1.4. Create CD Pipeline
- Create CI pipeline in Azure DevOps. Use Exising Azure Pipelines YAML file `azure-cd-pipelines.yml`
- Secure Azure DevOps credentials: 
  - `dev.usersname` and `dev.password`
  - `prod.usersname` and `prod.password`

#### 1.5. Run Pipeline
- Add your changesets in `scrips` directory
- Update `changelog.xml` as needed to refeclt your changeset
- Commit and push your local repo to remote repo
- Watch the CI pipeline automa-magically kick-off and trigger CD pipeline

### 2. Project Structure
```
liquibase-project/            
├── changelog.xml
├── scripts/
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

### 3. Pipeline Flow Summary

#### 3.1. Continuos Integration 
```
📦 CI Pipeline (validate code and package)
│
├── Validate Changelog
├── Show Pending Changes
├── Generate SQL Preview
├── Generate Rollback SQL
├── Deploy to Dev
├── Tag Database
├── Geberate Build Metadat
├── Build Artifacts
└── Publish Artifact:
    ├── changelog.xml
    ├── /scripts/*.sql
    ├── update-preview.sql
    ├── rollback-preview.sql
    ├── version.txt
    └── liquibase.properties (optional)
```

#### 3.2. Continous Deployment
```
🚀 CD Pipeline (test code ande promote to prod)
│
├── Triggered by CI
├── Downloads CI artifact
├── Deploys to staging/prod using changelog
└── References version/tag for auditing
```