drop table if exists Application;
drop table if exists Ticket;
drop table if exists User;
drop table if exists Software;
drop table if exists Host;
drop table if exists Datacenter;

create table Datacenter (
  id text primary key not null, 
  address text
);

create table Host (
  id text primary key not null,
  os text,
  cpus int,
  ramGB int,
  diskGB int,
  vmHost text references Host(id),
  datacenter text references Datacenter(id)
);

create table Software (
  id text primary key not null,
  vendor text,
  name text,
  version text
);

create table Application (
  id text primary key not null,
  software text references Software(id),
  runsOn text references Host(id)
);

create table User (
  id text primary key not null,
  name text
);

create table Ticket (
  id text primary key not null,
  description text,
  created date,
  user text references User(id),
  application text references Application(id)
);

