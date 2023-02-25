-- define a model that joins all the tables based on their foreign keys
{{
  config(
    materialized='table',
    unique_key='(director_id, movie_id, genre)',
    columns={
      'director_id': 'int',
      'movie_id': 'int',
      'first_name': 'varchar(100)',
      'last_name': 'varchar(100)',
      'genre': 'varchar(100)',
      'prob': 'float'
    }
  )
}}

SELECT
  CAST(movies_directors.movie_id AS SIGNED) as `movie_id`,
  CAST(directors.id AS SIGNED) as `director_id`,
  CAST(directors.first_name AS CHAR(100)) as `first_name`,
  CAST(directors.last_name AS CHAR(100)) as `last_name`,
  CAST(directors_genres.genre AS CHAR(100)) as `genre`,
  CAST(directors_genres.prob AS FLOAT) as `prob`
FROM {{ source('denormalize', 'movies_directors') }} movies_directors
JOIN {{ source('denormalize', 'directors') }} directors on movies_directors.director_id = directors.id
LEFT JOIN {{ source('denormalize', 'directors_genres') }} directors_genres on directors.id = directors_genres.director_id
