-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
CREATE TABLE materias (
  id BIGSERIAL PRIMARY KEY,
  departamento_id BIGINT,
  nombre VARCHAR,
  codigo VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX departamento_id_idx ON materias (departamento_id);
-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back

DROP TABLE IF EXISTS materias;