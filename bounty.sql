DROP TABLE IF EXISTS bounty;

CREATE TABLE bounty (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  last_known_location VARCHAR(255),
  favourite_weapon VARCHAR(255)
);
