-- +micrate Up
CREATE TABLE finals (
  id BIGSERIAL PRIMARY KEY,
  dia VARCHAR,
  mes VARCHAR,
  ano VARCHAR,
  materia_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX materia_id_idx ON finals (materia_id);

-- +micrate Down
DROP TABLE IF EXISTS finals;
