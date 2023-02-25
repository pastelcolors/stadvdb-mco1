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
  CAST(movies.id AS SIGNED) as `id`,
  CAST(movies.name AS CHAR(100)) as `name`,
  CAST(movies.rank AS FLOAT) as `rank`,
  CAST(movies.year AS SIGNED) as `year`,
FROM {{ source('denormalize', 'movies') }} movies