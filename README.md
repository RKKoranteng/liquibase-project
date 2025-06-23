## Liquibase Project

### User Story
**As a** database engineer <br>
**I want to**  automate deployment of database changes <br>
**So that** I can ensure consistent, traceable, and controlled database schema changes across development, staging, and production environments.

### Project Structure
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

### Flow Summary
```
CI Pipeline
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