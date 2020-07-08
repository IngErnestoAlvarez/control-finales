-- +micrate Up
CREATE TABLE materia (
  id BIGSERIAL PRIMARY KEY,
  nombre VARCHAR,
  codigo VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS materia;
