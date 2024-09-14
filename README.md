### DLP AWS Alerting System

<p align="justify">This project implements a Data Loss Prevention (DLP) alerting system using AWS services to identify and report sensitive personal data in real-time. It leverages **Amazon S3**, **Amazon Macie**, **AWS SNS**, **Amazon EventBridge**, and **AWS Security Hub** to provide automated detection and notifications when personal information is found in cloud storage.

#### Key Features:

- **Automated PII Detection:**<p align="justify"> Macie continuously scans the S3 bucket for personal identifiable information (PII) and sensitive data.

- **Real-Time Alerts:** <p align="justify">Alerts are sent via SNS to notify when personal information is detected, enabling immediate response.

- **Centralized Security Monitoring:**<p align="justify"> Findings are aggregated in AWS Security Hub, where they can be reviewed and acted upon.

- **Event-Driven Architecture:** <p align="justify">EventBridge triggers email notifications upon certain events (e.g., new bucket creation), ensuring proactive monitoring of S3 buckets.

#### Problem Tackled:

<p align="justify">With growing data privacy concerns, storing sensitive information in cloud storage requires robust monitoring. This system addresses:

- **Data breaches and leaks** <p align="justify">by alerting security teams when sensitive data is stored in S3.

- **Regulatory compliance** <p align="justify">by providing visibility into personal data exposure.

- **Proactive security**<p align="justify"> through automated monitoring and event-driven alerts.

<p align="justify">By automating the detection and response process, this system minimizes manual oversight, speeds up incident response, and reduces the risk of data exposure.
