"""
Investigation walkthrough:
- Load synthetic abuse telemetry
- Identify high-velocity scam behavior
- Surface coordinated abuse candidates for review

This script demonstrates how investigative insights
can be translated into detection logic for abuse monitoring.
"""


import pandas as pd

df = pd.read_csv("data/scam_events.csv")

candidates = df[
    (df["prompt_category"] == "scam") &
    (df["events_last_24h"] > 40) &
    (df["refusal_rate"] < 0.20)
]

print(candidates)
