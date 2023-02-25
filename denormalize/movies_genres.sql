-- define a model that joins all the tables based on their foreign keys
{{
  config(
    materialized='table',
    unique_key='(genre, movie_id)',
    columns={
      'genre': 'varchar(100)',
      'movie_id': 'int'
    }
  )
}}

SELECT
  CAST(movies_genres.genre AS CHAR(100)) as `genre`,
  CAST(movies_genres.movie_id AS SIGNED) as `movie_id`
FROM {{ source('denormalize', 'movies_genres') }} movies_genres