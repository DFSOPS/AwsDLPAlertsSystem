### DLP AWS Alerting System

This project implements a Data Loss Prevention (DLP) alerting system using AWS services to identify and report sensitive personal data in real-time. It leverages **Amazon S3**, **Amazon Macie**, **AWS SNS**, **Amazon EventBridge** and to provide automated detection and notifications when personal information is found in cloud storage.

#### Key Features:

- **Automated PII Detection:** Macie continuously scans the S3 bucket for personal identifiable information (PII) and sensitive data.

- **Real-Time Alerts:** Alerts are sent via SNS to notify when personal information is detected, enabling immediate response.

- **Centralized Security Monitoring:** Findings are aggregated in AWS Security Hub, where they can be reviewed and acted upon.

- **Event-Driven Architecture:** EventBridge triggers email notifications upon certain events (e.g., new bucket creation), ensuring proactive monitoring of S3 buckets.

#### Problem Tackled:

<p align="justify">With growing data privacy concerns, storing sensitive information in cloud storage requires robust monitoring. This system addresses:

- **Data breaches and leaks** by alerting security teams when sensitive data is stored in S3.

- **Regulatory compliance** by providing visibility into personal data exposure.

- **Proactive security** through automated monitoring and event-driven alerts.

By automating the detection and response process, this system minimizes manual oversight, speeds up incident response, and reduces the risk of data exposure.  

# DLP AWS Alerting System HLD

```mermaid
graph TD
    %% Define Services
    S3[S3 Bucket] --> Macie[Amazon Macie]
    Macie --> SNS[AWS SNS]
    SNS --> SecurityHub[AWS Security Hub]
    EventBridge[AWS EventBridge] --> SNS

    %% Define Components and Flow
    subgraph Data Storage
        S3
    end

    subgraph Data Scanning
        Macie
    end

    subgraph Notification System
        SNS
        SecurityHub
    end

    subgraph Event Management
        EventBridge
    end

    %% Real-Time Alerts and Event-Driven Actions
    S3 -- Stores sensitive data --> Macie
    Macie -- Scans and detects PII --> SNS
    SNS -- Sends alerts to --> SecurityHub
    EventBridge -- Triggers notifications for events --> SNS

    %% Additional Connections
    SecurityHub -- Aggregates findings from --> Macie
    SecurityHub -- Monitors and reviews findings --> Team[Security Team]

    %% Labels
    classDef data fill:#f9f,stroke:#333,stroke-width:2px;
    class S3,Macie,SNS,EventBridge data;
    class SecurityHub,Team fill:#ccf,stroke:#333,stroke-width:2px;
