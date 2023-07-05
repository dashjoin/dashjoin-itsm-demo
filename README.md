# Dashjoin ITSM Demo

This scenario starts with an empty platform. The only existing asset is a SQL database with IT service management data.

## Setup

To setup the demo, run the following command:

```
docker run -p 8080:8080 -e DJ_ADMIN_PASS=djdjdj -e DASHJOIN_HOME=dashjoin-itsm-demo -e DASHJOIN_APPURL=https://github.com/dashjoin/dashjoin-itsm-demo dashjoin/platform
```

The command line arguments

* run the Dashjoin Platform and expose port 8080
* set the admin password to 'djdjdj'
* install the ITSM database

## Connecting the Database

Visit the [database dashboard](http://localhost:8080/#/table/config/dj-database) and choose

* SQL Database
* name itsm
* database URL: jdbc:sqlite:itsm.db

## Browse the Data

* Visit the [ticket page](http://localhost:8080/#/table/itsm/Ticket), browse and sort the tickets
* Enter a new ticket, application and user can be added using autocomplete which is based on the foreign key
* Search for "vmware", which lists entries in different tables

## Customizing the Application

* Go to the Datacenter page and add a Map widget using the expression "value.address"
* London datacenter has a typo, add "n" to "Madela" for the map to show up
* On the home page, add a pie chart widget with the query: select hosts grouped by datacenter
* Note that you can click on the chart to get to the datacenter page

## ETL

* To prepare the data, run ```git clone https://github.com/mitre/cti``` in the upload folder
* The database already contains information from the National Vulnerability Database (NVD)
* The Cyber Dashboard already shows that some of the software is affected by various CVEs
* We now load information from the MITRE Attack framework to get more information
* ETL this expression 
  * ```$ls(\"file:upload/cti/enterprise-attack/relationship\").url.$openJson($)```
  * Change the column "objects" to "objects.description"
  * Change the table name to "mitre"
* We can now do a full text search for our [CVE](http://localhost:8080/#/search/itsm/mitre/CVE-2021-44228)
