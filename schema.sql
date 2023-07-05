drop table if exists Datacenter;
drop table if exists Host;
drop table if exists Software;
drop table if exists Application;
drop table if exists Ticket;
drop table if exists User;

create table Datacenter (
  id text primary key, 
  address text
);

create table Host (
  id text primary key,
  os text,
  cpus int,
  ramGB int,
  diskGB int,
  vmHost text references id,
  datacenter text references Datacenter(id)
);

create table Software (
  id text primary key,
  vendor text,
  name text,
  version text
);

create table Application (
  id text primary key,
  software text references Software(id),
  runsOn text references Host(id)
);

create table User (
  id text primary key,
  name text
);

create table Ticket (
  id text primary key,
  description text,
  created date,
  user text references User(id),
  application text references Application(id)
);

