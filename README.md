### DLP AWS Alerting System

This project implements a Data Loss Prevention (DLP) alerting system using AWS services to identify and report sensitive personal data in real-time. It leverages **Amazon S3**, **Amazon Macie**, **AWS SNS**, **Amazon EventBridge**, and **AWS Security Hub** to provide automated detection and notifications when personal information is found in cloud storage.

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
    subgraph DataLossPreventionSystem
        S3[S3 Bucket]
        Macie[Amazon Macie]
        SNS[AWS SNS]
        EventBridge[AWS EventBridge]
        SecurityHub[AWS Security Hub]
    end

    %% Data Flow
    S3 --> Macie
    Macie --> SNS
    SNS -->|Alert Notification| SecurityHub
    EventBridge -->|Trigger Event| SNS

    %% Connections
    Macie -->|Scan Results| SecurityHub
    EventBridge -->|Bucket Creation Event| S3

    %% Key Features
    subgraph KeyFeatures
        PII_Detection[Automated PII Detection]
        RealTimeAlerts[Real-Time Alerts]
        CentralizedMonitoring[Centralized Security Monitoring]
        EventDriven[Event-Driven Architecture]
    end

    %% Feature Mapping
    PII_Detection --> Macie
    RealTimeAlerts --> SNS
    CentralizedMonitoring --> SecurityHub
    EventDriven --> EventBridge
