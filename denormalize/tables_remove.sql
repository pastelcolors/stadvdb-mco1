{{
  config(
    materialized='ephemeral'
  )
}}

{{ drop_tables(['directors_genres', 'movies_directors', 'directors', 'roles', 'actors']) }}