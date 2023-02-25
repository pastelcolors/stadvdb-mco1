{{
  config(
    materialized='ephemeral'
  )
}}

{{ add_primary_key_constraint('movies', 'id') }}

{{ add_primary_key_constraint('movie_directors', 'director_id, movie_id') }}

{{ add_primary_key_constraint('role_actors', 'actor_id, movie_id') }}

{{ add_foreign_key_constraint('movies', 'id', 'movie_directors', 'movie_id') }}

{{ add_foreign_key_constraint('movies', 'id', 'role_actors', 'movie_id') }}

{{ add_foreign_key_constraint('movies', 'id', 'movies_genres', 'movie_id') }}