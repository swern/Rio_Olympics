DROP TABLE medals;
DROP TABLE athletes;
DROP TABLE nations;
DROP TABLE events;

CREATE TABLE nations(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  points int4
);

CREATE TABLE athletes(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  nation_id int4 references nations(id)
);

CREATE TABLE events(
  id serial4 PRIMARY KEY,
  name VARCHAR(255)
); 

CREATE TABLE medals(
  id serial4 PRIMARY KEY,
  type VARCHAR(255),
  athlete_id int4 references athletes(id),
  event_id int4 references events(id)
);