with un as (
    select distinct bus_id from bus_to_sub
), un_count as (
    select count(un.*) count
    from un
), total_count as (
    select count(*) count from bus_to_sub
)
select * from un_count
where count not in (select * from total_count)