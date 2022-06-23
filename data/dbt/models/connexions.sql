with src as (
    select br.*, bs.geom as src_geom
    from branches br
             join {{ref('buses')}} bs on bs.id = br.from_bus_id
), dst as (
    select br.*, bs.geom as dst_geom
    from branches br
             join {{ref('buses')}} bs on bs.id = br.to_bus_id
)
select src.branch_id id, src.from_bus_id src_id, src.to_bus_id dst_id,
       src.r resistance, src.x reactance, src.b total_charging,
       src.ratea, src.rateb, src.ratec, src.ratio, src.angle, src.status, src.angmin min_angle_diff,
       src.angmax max_angle_difference, src.pf real_power_from, src.qf reactive_power_from,
       src.branch_device_type, src.interconnect,
       src.src_geom, dst.dst_geom, st_makeline(src.src_geom, dst.dst_geom) geom
from src join dst on src.branch_id = dst.branch_id