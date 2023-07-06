PRAGMA foreign_keys = 1;

delete from User;
delete from Application;
delete from Ticket;
delete from Software;
delete from Host;
delete from Datacenter;

INSERT INTO Software
VALUES
  ("netapp-ontap", "netapp", "ontap_tools", "11", "ONTAP helps you create a storage infrastructure that reduces costs, accelerates critical workloads, and protects and secures data across your hybrid multicloud"),
  ("vmware-vsphere-9", "vmware", "vsphere", "9", "VMware vSphere is a suite of software components for virtualization. These include ESXi, vCenter Server, and other software components that fulfill several different functions in the vSphere environment"),
  ("sap-host-agent", "sap", "host_agent", "7.22", "The SAP Host Agent is a tool that you can use for monitoring and controlling SAP and non-SAP instances, operating systems, and databases. It is installed automatically during the installation of new SAP instances with SAP kernel 7.20 or higher."),
  ("windows-server-2019", "micosoft", "windows-server", "2019", "Windows Server 2019 is the ninth version of the Windows Server operating system by Microsoft, as part of the Windows NT family of operating systems. It is the second version of the server operating system based on the Windows 10 platform, after Windows Server 2016."),
  ("exchange-2019", "micosoft", "exchange", "2019", "Microsoft Exchange Server is a mail server and calendaring server developed by Microsoft. It runs exclusively on Windows Server operating systems."),
  ("netweaver_application_server_abap", "sap", "netweaver_application_server_abap"  ,             "8",  "SAP NetWeaver is a technology platform that allows organizations to integrate data, business processes, elements and more from a variety of sources into unified SAP environments"),
  ("netweaver_application_server_abap_kernel", "sap",  "netweaver_application_server_abap_kernel" ,       "8",    "ABAP Kernel component for SAP"),
  ("netweaver_application_server_abap_krnl64nuc", "sap",  "netweaver_application_server_abap_krnl64nuc" ,    "8",    "Netweaver linux kernel"),
  ("netweaver_application_server_abap_krnl64uc", "sap",  "netweaver_application_server_abap_krnl64uc",      "8",    "SAP NetWeaver is a technology platform that allows organizations to integrate data, business processes, elements and more from a variety of sources into unified SAP environments"),
  ("business_objects_business_intelligence_platform", "sap",  "business_objects_business_intelligence_platform", "8",    "Business Objects was an enterprise software company, specializing in business intelligence. Business Objects was acquired in 2007 by German company SAP AG. The company claimed more than 46,000 customers in its final earnings release prior to being acquired by SAP"),
  ("business_planning_and_consolidation", "sap",  "business_planning_and_consolidation" ,            "8",    "Business planning and consolidation suite"),
  ("netweaver_application_server_for_java", "sap",  "netweaver_application_server_for_java" ,          "8",    "Netweaver Java stack"),
  ("businessobjects_business_intelligence_platform", "sap",  "businessobjects_business_intelligence_platform",  "8",    "Business Objects was an enterprise software company, specializing in business intelligence. Business Objects was acquired in 2007 by German company SAP AG. The company claimed more than 46,000 customers in its final earnings release prior to being acquired by SAP"),
  ("grc_process_control", "sap", "grc_process_control", "8",    ""),
  ("netweaver", "sap", "netweaver", "8",    ""),
  ("bank_account_management", "sap", "bank_account_management", "8",    ""),
  ("solution_manager", "sap", "solution_manager", "8",    ""),
  ("junos", "juniper", "junos" ,  "8",    ""),
  ("junos_os_evolved", "juniper", "junos_os_evolved",              "8",    ""),
  ("modbus_tcp_server_add_on_instructions", "rockwellautomation", "modbus_tcp_server_add_on_instructions",           "8",    ""),
  ("twake", "linagora", "twake", "8",    ""),
  ("linux_kernel", "linux", "linux_kernel", "8",    ""),
  ("pdf_viewer", "pdf_viewer_project",  "pdf_viewer", "8",    "");

INSERT INTO Datacenter
VALUES
  ("Stuttgart", "Kronenstr. 14, Stuttgart"),
  ("London", "Madela Way 9, London"),
  ("Los Angeles", "3300 Lomita Blvd, Torrance, CA 90505, United States");

INSERT INTO Host
VALUES
  ("vmware03", "vmware", 4, 256, 1014, null, "London"),
  ("vmware04", "vmware", 4, 256, 1014, null, "Los Angeles"),
  ("vmware01", "vmware", 2, 128, 1014, null, "Stuttgart"),
  ("vmware02", "vmware", 2, 128, 1014, null, "Stuttgart"),
  ("dc", "windows", 1, 32, 128, "vmware01", "Stuttgart"),
  ("sap", "windows", 1, 32, 128, "vmware01", "Stuttgart"),
  ("exchange", "windows", 1, 32, 128, "vmware02", "Stuttgart");

INSERT INTO Application
VALUES
  ("netapp-ontap", "netapp-ontap", "vmware03"),
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
