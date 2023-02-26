-- define a model that joins all the tables based on their foreign keys
{{
  config(
    materialized='table',
    unique_key='(id)',
    columns={
      'id': 'int',
      'director_id': 'int',
      'actor_id': 'int',
      'name': 'varchar(100)',
      'rank': 'float',
      'year': 'int',
    }
  )
}}

SELECT
  CAST(movies.id AS SIGNED) as `id`,
  CAST(md.director_id AS SIGNED) as `director_id`,
  CAST(ra.actor_id AS SIGNED) as `actor_id`,
  CAST(mg.genre_id AS SIGNED) as `genre_id`,
  CAST(movies.name AS CHAR(100)) as `name`,
  CAST(movies.rank AS FLOAT) as `rank`,
  CAST(movies.year AS SIGNED) as `year`
FROM {{ source('denormalize', 'movies') }} movies
JOIN {{ source('denormalize', 'movie_directors') }} md ON md.movie_id = movies.id 
JOIN {{ source('denormalize', 'role_actors') }} ra ON ra.movie_id = movies.id 
JOIN {{ source('denormalize', 'movies_genres') }} mg ON mg.movie_id = movies.id 