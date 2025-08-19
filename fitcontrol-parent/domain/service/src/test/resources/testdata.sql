
CREATE TABLE IF NOT EXISTS workout (

  title VARCHAR,
  date TIMESTAMP,
  duration BIGINT
);

INSERT INTO workout ( title, date, duration)
VALUES ('Morning Workout', '2025-08-08T07:30:00', 3600);

INSERT INTO workout (title, date, duration)
VALUES ('Evening Yoga', '2025-08-07T18:00:00', 1800);


CREATE TABLE IF NOT EXISTS  exercise (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR,
  description VARCHAR
);

INSERT INTO exercise (id, title, description)
VALUES (1, 'Bodyweight Squats', 'bodyweight exercise');
INSERT INTO exercise (id, title, description)
VALUES (2, 'Bodyweight PushUps', 'bodyweight exercise');
INSERT INTO exercise (id, title, description)
VALUES (3, 'SitUps', 'bodyweight exercise');
INSERT INTO exercise (id, title, description)
VALUES (4, 'Single Leg RDLs', 'bodyweight exercise');

CREATE TABLE IF NOT EXISTS workout_exercise (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR,
  description VARCHAR,
  workout_id BIGINT,
  exercise_id BIGINT
);

INSERT INTO workout_exercise (id, title, description, workout_id, exercise_id)
VALUES (1, 'Bodyweight Squats', 'bodyweight exercise', 1, 1);

INSERT INTO workout_exercise (id, title, description, workout_id, exercise_id)
VALUES (2, 'Bodyweight PushUps', 'bodyweight exercise', 1, 2);



