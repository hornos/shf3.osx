DROP TABLE IF EXISTS net_ipfw;

CREATE TABLE net_ipfw (
  -- rules
  rno   NUMERIC NOT NULL,
  sno   NUMERIC NOT NULL,
  act   CHARACTER(8),
  rule  TEXT NOT NULL,
  UNIQUE(rno,sno,rule)
);
