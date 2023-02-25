-- create a new table called "roles_actors" to denormalize the data
{{ config(
    materialized='table',
    unique_key='(actor_id, movie_id, role)',
    columns={
        'movie_id': 'varchar(100)',
        'role': 'varchar(100)',
        'actor_first_name': 'varchar(100)',
        'actor_last_name': 'varchar(100)',
        'actor_gender': 'char(1)'
    }
) }}

SELECT 
  CAST(roles.actor_id AS SIGNED) AS `actor_id`,
  CAST(roles.movie_id AS SIGNED) as `movie_id`,
  CAST(roles.role AS CHAR(100)) as `role`,
  CAST(actors.first_name AS CHAR(100)) AS `actor_first_name`,
  CAST(actors.last_name AS CHAR(100)) AS `actor_last_name`,
  CAST(actors.gender AS CHAR(1)) AS `actor_gender`
FROM {{ source('denormalize', 'roles') }} roles
LEFT JOIN {{ source('denormalize', 'actors') }} actors ON roles.actor_id = actors.id


