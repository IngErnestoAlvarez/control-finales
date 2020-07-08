-- +micrate Up
CREATE TABLE finals (
  id BIGSERIAL PRIMARY KEY,
  dia VARCHAR,
  mes VARCHAR,
  ano VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS finals;
