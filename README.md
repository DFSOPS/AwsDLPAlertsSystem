### DLP AWS Alerting System

This project implements a Data Loss Prevention (DLP) alerting system using AWS services to identify and report sensitive personal data in real-time. It leverages **Amazon S3**, **Amazon Macie**, **AWS SNS**, **AWS Lambda** and **Amazon EventBridge** to provide automated detection and notifications when personal information is found in cloud storage. Email and an automated 

#### Key Features:

- **Automated PII Detection:** Macie continuously scans the S3 bucket for personal identifiable information (PII) and sensitive data.

- **Real-Time Alerts:** Alerts are sent via SNS to notify when personal information is detected, enabling immediate response.

- **Event-Driven Architecture:** EventBridge triggers notifications upon certain events (e.g., new bucket creation), ensuring proactive monitoring of S3 buckets.

#### Problem Tackled:

With growing data privacy concerns, storing sensitive information in cloud storage requires robust monitoring. This system addresses:

- **Data breaches and leaks** by alerting security teams when sensitive data is stored in S3.

- **Regulatory compliance** by providing visibility into personal data exposure.

- **Proactive security** through automated monitoring and event-driven alerts.

By automating the detection and response process, this system minimizes manual oversight, speeds up incident response, and reduces the risk of data exposure.

# DLP AWS Alerting System HLD

```mermaid
flowchart TD;
    A[User] -->|Uploads Data| B[S3 Bucket]
    B -->|Scanned for PII| C[Amazon Macie]
    C -->|Identifies PII| D[Amazon SNS]
    D -->|Sends Email| G[Email Notification]
    D -->|Triggers Lambda| H[Lambda Function]
    H -->|Sends Alert to| I[Slack]
    F[Amazon EventBridge] -->|Triggers on Events| D
    B -->|Creates Event| F

    %% Style the nodes
    classDef userStyle fill:#f9f,stroke:#333,stroke-width:2px;
    classDef bucketStyle fill:#bbf,stroke:#333,stroke-width:2px;
    classDef serviceStyle fill:#bbf,stroke:#333,stroke-width:2px;
    classDef alertStyle fill:#ffb,stroke:#333,stroke-width:2px;

    class A userStyle;
    class B bucketStyle;
    class C serviceStyle;
    class D alertStyle;
    class G alertStyle;
    class H serviceStyle;
    class I alertStyle;

    %% Labels
    classDef data fill:#f9f,stroke:#333,stroke-width:2px;
    class S3,Macie,SNS,EventBridge data;




