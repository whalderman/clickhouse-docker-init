CREATE TABLE IF NOT EXISTS testtable (ver DateTime DEFAULT now())
ENGINE = ReplacingMergeTree /* replace duplicates as determined by the "ORDER BY" values below */
PARTITION BY toYYYYMM(ver)
ORDER BY (ver)
TTL ver + INTERVAL 60 MONTH DELETE;
