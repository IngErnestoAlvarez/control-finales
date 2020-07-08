-- +micrate Up
CREATE TABLE departamentos (
  id BIGSERIAL PRIMARY KEY,
  nombre VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS departamentos;
