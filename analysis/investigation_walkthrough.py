import pandas as pd

df = pd.read_csv("data/scam_events.csv")

candidates = df[
    (df["prompt_category"] == "scam") &
    (df["events_last_24h"] > 40) &
    (df["refusal_rate"] < 0.20)
]

print(candidates)
