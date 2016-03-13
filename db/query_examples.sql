use development;

#Select All Clients
select * from clients;

#Select all Client Versions
select * from client_versions order by client_id;

#Select all from Stages
select * from stages order by client_id, sequence;

#Select all visits
select * from visits v join visitors vs on v.visitor_id = vs.id;

#Sum visits
select c.name, s.name, count(1) from visits v 
join visitors vs on v.visitor_id = vs.id
join clients c on c.id = vs.client_id 
join stages s on s.id = v.stage_id
group by 1, 2;
