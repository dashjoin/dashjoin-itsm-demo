PRAGMA foreign_keys = 1;

delete from User;
delete from Application;
delete from Ticket;
delete from Software;
delete from Host;
delete from Datacenter;

INSERT INTO Software
VALUES
  ("vmware-vsphere-9", "vmware", "vsphere", "9"),
  ("sap-host-agent", "sap", "host_agent", "7.22"),
  ("windows-server-2019", "micosoft", "windows-server", "2019"),
  ("exchange-2019", "micosoft", "exchange", "2019");

INSERT INTO Datacenter
VALUES
  ("Stuttgart", "Kronenstr. 14, Stuttgart"),
  ("London", "Madela Way 9, London"),
  ("Los Angeles", "3300 Lomita Blvd, Torrance, CA 90505, United States");

INSERT INTO Host
VALUES
  ("vmware01", "vmware", 2, 128, 1014, null, "Stuttgart"),
  ("vmware02", "vmware", 2, 128, 1014, null, "Stuttgart"),
  ("dc", "windows", 1, 32, 128, "vmware01", "Stuttgart"),
  ("sap", "windows", 1, 32, 128, "vmware01", "Stuttgart"),
  ("exchange", "windows", 1, 32, 128, "vmware02", "Stuttgart");

INSERT INTO Application
VALUES
  ("sap-agent", "sap-host-agent", "sap"),
  ("windows-sap", "windows-server-2019", "sap");

INSERT INTO User (id,name)
VALUES
  ("pellentesque@protonmail.org","Thomas Estes"),
  ("et@google.couk","Keith Collins"),
  ("eu@yahoo.ca","Channing Holt"),
  ("fusce.aliquam@protonmail.couk","Jakeem Boyd"),
  ("dolor.quam.elementum@google.org","Leigh Stanley"),
  ("auctor.vitae@aol.couk","Mechelle O'brien"),
  ("at.fringilla@protonmail.org","Jonas Mercer"),
  ("nunc.ullamcorper@aol.couk","Breanna Shannon"),
  ("orci.ut@outlook.org","Rowan Drake"),
  ("eros.turpis@yahoo.org","Paul Scott"),
  ("sed.dolor@aol.ca","Whitney Mccullough"),
  ("etiam.imperdiet@google.couk","Clio Pierce"),
  ("sodales.mauris.blandit@hotmail.net","Silas Levine"),
  ("morbi.sit@hotmail.couk","Reece Tate"),
  ("sagittis.felis@google.net","Judith Ware"),
  ("semper.et@hotmail.com","Adrian Rush"),
  ("maecenas@icloud.ca","Cassandra Lawson"),
  ("lacus.ut@protonmail.net","Laith Lynch");
