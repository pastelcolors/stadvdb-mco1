-- define a model that joins all the tables based on their foreign keys
{{
  config(
    materialized='table',
    unique_key='(director_id, movie_id)',
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
  movies_directors.movie_id as `movie_id`,
  directors.id as `director_id`,
  directors.first_name as `first_name`,
  directors.last_name as `last_name`,
  directors_genres.genre as `genre`,
  directors_genres.prob as `prob`
FROM {{ source('denormalize', 'movies_directors') }} movies_directors
JOIN {{ source('denormalize', 'directors') }} directors on movies_directors.director_id = directors.id
LEFT JOIN {{ source('denormalize', 'directors_genres') }} directors_genres on directors.id = directors_genres.director_id
