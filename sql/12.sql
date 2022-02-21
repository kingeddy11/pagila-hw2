/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */


select *
from
(
    select title
    from
    (
        select title, unnest(special_features) as special_feature
        from film
    ) bts
    where special_feature = 'Behind the Scenes'
) d1
inner join
(
    select title
    from
    (
        select title, unnest(special_features) as special_feature
        from film
    ) t
    where special_feature = 'Trailers'
) d2 using(title)
order by title;
