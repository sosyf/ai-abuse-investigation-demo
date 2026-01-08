-- Goal: identify coordinated scam activity missed by existing systems

-- 1. Baseline: high-velocity activity
SELECT
  account_id,
  country,
  ip_asn,
  events_last_24h,
  refusal_rate,
  reported
FROM scam_events
WHERE events_last_24h > 30;

-- 2. Coordinated infrastructure signal
SELECT
  ip_asn,
  COUNT(DISTINCT account_id) AS accounts,
  AVG(events_last_24h) AS avg_events
FROM scam_events
WHERE prompt_category = 'scam'
GROUP BY ip_asn
HAVING COUNT(DISTINCT account_id) >= 3;

-- 3. Candidate review queue
SELECT
  account_id,
  country,
  ip_asn,
  events_last_24h,
  refusal_rate,
  reported
FROM scam_events
WHERE
  prompt_category = 'scam'
  AND events_last_24h > 40
  AND refusal_rate < 0.20;
