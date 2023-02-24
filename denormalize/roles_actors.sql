-- create a new table called "roles_actors" to denormalize the data
{{ config(
    materialized='table',
    unique_key='(movie_id, role, actor_first_name, actor_last_name)',
    columns={
        'movie_id': 'varchar(100)',
        'role': 'varchar(100)',
        'actor_first_name': 'varchar(100)',
        'actor_last_name': 'varchar(100)',
        'actor_gender': 'char(1)'
    }
) }}

SELECT 
  roles.movie_id as `movie_id`,
  roles.role as `role`,
  actors.first_name AS `actor_first_name`,
  actors.last_name AS `actor_last_name`,
  actors.gender AS `actor_gender`
FROM imdb_test.roles roles
LEFT JOIN imdb_test.actors actors ON roles.actor_id = actors.id


