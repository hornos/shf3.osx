DROP TABLE IF EXISTS net_ipfw;

CREATE TABLE net_ipfw (
  -- rules
  i     NUMERIC NOT NULL,
  s     NUMERIC NOT NULL,
  func  TEXT NOT NULL,
  state NUMERIC NOT NULL DEFAULT 0,
  PRIMARY KEY(i),
  UNIQUE(i,func)
);
