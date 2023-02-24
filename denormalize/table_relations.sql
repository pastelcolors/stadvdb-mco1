{{
  config(
    materialized='ephemeral'
  )
}}

{{ add_primary_key_constraint('movies', 'id') }}

{{ add_foreign_key_constraint('movies', 'id', 'movie_directors', 'movie_id') }}

{{ add_foreign_key_constraint('movies', 'id', 'role_actors', 'movie_id') }}

{{ add_foreign_key_constraint('movies', 'id', 'movies_genres', 'movie_id') }}

