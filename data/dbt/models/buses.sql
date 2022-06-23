select b.bus_id id, b.type, b.pd power_demand,
    b.qd reactive_power_demand, b.gs shunt_conductance,
    b.bs shunt_susceptance, b.zone_id, b.va voltage_angle,
    b.basekv base_voltage, b.loss_zone, b.vmax max_voltage,
    b.vmin min_voltage, b.interconnect, s.latitude, s.longitude, s.geom
from buses b
join bus_to_sub bts on b.bus_id = bts.bus_id
join {{ref('substations')}} s on bts.sub_id = s.id