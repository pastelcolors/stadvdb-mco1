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
  movies_directors.movie_id,
  directors.id as director_id,
  directors.first_name as director_first_name,
  directors.last_name as director_last_name,
  directors_genres.genre as director_genre,
  directors_genres.prob as director_genre_probability
FROM {{ ref('movies_directors_ab3') }} movies_directors
JOIN {{ ref('directors_ab3') }} directors on movies_directors.director_id = directors.id
LEFT JOIN {{ ref('directors_genres_ab3') }} directors_genres on directors.id = directors_genres.director_id;
