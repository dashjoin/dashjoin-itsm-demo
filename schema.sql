-- base tables of the ITSM demo (cve, vulnerability and mitre are loaded by ETL)
drop table if exists Ticket;
drop table if exists User;
drop table if exists Application;
drop table if exists Software;
drop table if exists Host;
drop table if exists Datacenter;

CREATE TABLE Datacenter (
  id text primary key not null, 
  address text
);

CREATE TABLE Host (
  id text primary key not null,
  os text,
  cpus int,
  ramGB int,
  diskGB int,
  vmHost text references Host(id),
  datacenter text references Datacenter(id)
);

CREATE TABLE Software (
  id text primary key not null,
  vendor text,
  name text,
  version text,
  description text
);

CREATE TABLE Application (
  id text primary key not null,
  software text references Software(id),
  runsOn text references Host(id),
  description text
);

CREATE TABLE User (
  id text primary key not null,
  name text
);

CREATE TABLE Ticket (
  id integer primary key autoincrement,
  title text not null,
  description text,
  created text,
  user text references User(id),
  severity text,
  status text,
  assignee text,
  application text references Application(id),
  resolved text
);

