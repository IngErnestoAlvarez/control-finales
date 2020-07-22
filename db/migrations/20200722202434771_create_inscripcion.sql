-- +micrate Up
CREATE TABLE inscripcions (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT,
  final_id BIGINT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE INDEX final_id_idx ON inscripcions (final_id);
CREATE INDEX user_id_idx ON inscripcions (user_id);

-- +micrate Down
DROP TABLE IF EXISTS inscripcions;
