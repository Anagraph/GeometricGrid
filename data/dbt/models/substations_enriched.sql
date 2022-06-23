with buses_within as (
    select s.id
    from {{ref('substations')}} s, {{ref('buses')}} b
    where st_dwithin(s.geom, b.geom, 0.00001)
), count_buses as (
    select id, count(*) num_buses from buses_within group by id
), transformer as (
    select bts.sub_id id
    from dbt.connexions c
    join dbt.buses b on c.src_id = b.id
    join bus_to_sub bts on b.id = bts.bus_id
    where c.branch_device_type != 'Line'
)

select s.*, b.num_buses,
       case
            when s.id in (select id from transformer) then true
            else false
        end transformer
from {{ref('substations')}} s
join count_buses b on b.id = s.id
