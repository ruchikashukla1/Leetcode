with movie_rater as  
(
    select name as metric, u.user_id, count(distinct movie_id)
    from users u inner join movierating mr on u.user_id = mr.user_id
    group by 1, 2
    order by 3 desc, 1 asc
    limit 1
), 

highest_rating_feb as (

    select m.movie_id, title as metric, avg(rating) 
    from movies m inner join movierating mr on m.movie_id = mr.movie_id
    where created_at::text like '2020-02%'
    group by 1,2 
    order by 3 desc, 2 asc
    limit 1
)

select metric as results from movie_rater 
union all
select metric as results from highest_rating_feb 