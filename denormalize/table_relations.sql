{{
  config(
    materialized='ephemeral'
  )
}}

{{ add_primary_key_constraint('movies', 'id, genre_id, director_id') }}


{{ add_primary_key_constraint('movie_directors', 'director_id, movie_id, genre') }}

{{ add_primary_key_constraint('role_actors', 'actor_id, movie_id, role') }}

{{ add_primary_key_constraint('movies_genres', 'genre_id') }}

{{ add_foreign_key_constraint('movie_directors', 'director_id', 'movies', 'director_id') }}

{{ add_foreign_key_constraint('role_actors', 'actor_id', 'movies', 'actor_id') }}

{{ add_foreign_key_constraint('movies_genres', 'genre_id', 'movies', 'genre_id') }}