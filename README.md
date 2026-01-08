# AI Abuse Investigation Demo

## Overview
This repository demonstrates a simplified investigation workflow for identifying coordinated AI-assisted scam activity that may bypass existing safety systems in a conversational AI product.

The project mirrors Protection Science / Integrity Investigation work by translating investigative intuition into concrete detection logic using SQL and Python.

## Scenario
Synthetic telemetry simulates abuse of an AI assistant to generate scam and phishing content. Some activity is surfaced through user reports, while other activity remains undetected and requires proactive behavioral monitoring.

## Data
The dataset (`data/scam_events.csv`) includes:
- Account-level activity volume (events in last 24h)
- Infrastructure signals (IP ASN)
- Prompt category labels (synthetic)
- Refusal rates and user-report indicators

All data is synthetic and created solely for demonstration purposes.

## Investigation Approach
1. **Behavioral thresholding**  
   Identify high-velocity usage inconsistent with normal user behavior.

2. **Coordination detection**  
   Surface clusters of accounts sharing infrastructure (ASN) and behavioral patterns.

3. **Candidate review queue**  
   Produce a shortlist of accounts requiring human investigation or enforcement.

## Detection Logic
Detection logic is implemented in:
- `sql/detection_queries.sql` (aggregation, coordination signals)
- `analysis/investigation_walkthrough.py` (Python-based filtering and analysis)
The resulting candidate review queue is available in `outputs/review_queue.csv`.

### Quickstart (Python)
Run the investigation script to surface candidate accounts for review:

```bash
python analysis/investigation_walkthrough.py

## Expected output:
A table of candidate accounts flagged for review based on high-velocity scam activity, shared infrastructure signals, and evasion indicators.


## Key Insight
Several scam accounts exhibit strong behavioral and infrastructure signals without corresponding user reports, highlighting a detection gap that requires proactive monitoring rather than reactive enforcement.

## How This Would Scale
In a production environment, this logic would be applied to streaming telemetry and combined with:
- Automated review queues
- Escalation workflows
- Feedback loops to improve upstream classifiers

## Disclaimer
This project uses fully synthetic data and does not reflect real user activity or proprietary systems.
