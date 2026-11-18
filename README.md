# Dashjoin IT Service Management Demo

<img width="1245" height="759" alt="image" src="https://github.com/user-attachments/assets/f0543937-a200-43ce-98eb-4c60e7578781" />

An IT service desk built on the Dashjoin Low Code Platform: tickets, infrastructure (datacenters, hosts, VMs,
applications), known vulnerabilities from the National Vulnerability Database (NVD) and threat intel from MITRE ATT&CK,
all in one SQLite database (`itsm.db`). Every page is a short JSON file in `model/`.

```
docker run -p 8080:8080 -e DJ_ADMIN_PASS=djdjdj -e DASHJOIN_HOME=dashjoin-itsm-demo -e DASHJOIN_APPURL=https://github.com/dashjoin/dashjoin-itsm-demo dashjoin/platform
```

Then open http://localhost:8080 and log in as `admin` / `djdjdj`.

## What's inside

| Where | Shows |
|-------|-------|
| [Operations](model/page/Home.json) | animated [html "operations center"](model/page/Home.hero.html) (radar, live clock, counters, datacenter health), charts, open tickets ranked by severity, datacenter map |
| [Triage](model/page/Triage.json) | editable `datagrid` of unresolved tickets |
| [Security](model/page/Security.json) | CVEs per application, exposure table with CVSS ratings, full text threat intel search across all tables |
| [Infrastructure](model/page/Infrastructure.json) | `diagram` [topology](model/page/Infrastructure.topology.jsonata) and a `tree` [hierarchy](model/page/Infrastructure.hierarchy.jsonata) of datacenters, hosts, VMs and applications |
| [My tickets](model/page/MyTickets.json) | self service page for requesters: "report an issue" form and their own tickets |
| [record pages](model/dj-database/dj%2Fitsm.json) | Ticket ("take it" / "resolve" buttons), Application (known CVEs), Host, Datacenter (map), Software, CVE (affected applications, MITRE mentions) |
| triggers | Ticket `before-create` sets created time, status and reporter; `before-update` stamps the resolution time |
| [functions](model/dj-function) | `my-tickets` / `report-issue` run as `agent` but are always scoped to the caller; `mitre` ETL loads ATT&CK relationships |
| [library](model/dj-library/cvss-rating.json) | `cvss-rating` turns a score into 🔴 critical … 🟢 low, with unit tests |
| [menu](model/widget/dj-sidenav.menu.jsonata) and [theme](model/dj-config/theme.json) | role dependent side navigation and colors |

## Roles

- `agent`: reads and changes everything; home page *Operations*
- `requester`: only *My tickets*. Requesters have no direct access to the database: the `my-tickets` and `report-issue`
  functions use `runas: agent` and always filter by / stamp the caller's user ID, so nobody sees other people's tickets
- `admin`: everything, including configuration

For local testing, add users to `djusers.properties` / `djroles.properties` (see the `roles-and-permissions` skill), e.g.
`joe=requester,authenticated`.

## Data

- `schema.sql` and `data.sql` create the base tables (Datacenter, Host, Software, Application, User, Ticket) with sample data
- `cve` and `vulnerability` hold NVD data from 2023, matched to the software catalog by vendor and product name
- `mitre` is loaded from [MITRE CTI](https://github.com/mitre/cti) relationship files in `upload/cti` by the `mitre` ETL.
  The repository includes a small sample. For the full data set, run `git clone https://github.com/mitre/cti` in `upload`
  and run the ETL again

Check the app with `$djLint()` or the page `/#/page/Lint`.

## Walkthrough: building it yourself

The app started from nothing but the SQL database. To recreate the main steps on an empty platform:

1. **Connect the database**: on the [database page](http://localhost:8080/#/config/dj-database) create a SQL database
   named `itsm` with the URL `jdbc:sqlite:itsm.db`. All tables and foreign keys are discovered automatically
2. **Browse the data**: open the [tickets](http://localhost:8080/#/itsm/Ticket), sort them, and create a new one. User and
   application offer autocomplete because they are foreign keys. Search for "vmware" to find matches in several tables
3. **Customize a record page**: on a datacenter page, add a map widget with the expression `value.address`
4. **Add a chart**: on a dashboard, add a chart widget with a query that counts hosts per datacenter. Clicking a bar
   opens that datacenter
5. **Load threat intel (ETL)**: create an ETL function with the expression
   `$ls("file:upload/cti/enterprise-attack/relationship").url.$openJson($)`, map the column `objects` to
   `objects.description` and name the table `mitre`
6. **Search across everything**: search for [CVE-2021-44228](http://localhost:8080/#/search/CVE-2021-44228) (log4j) to see
   the CVE, the affected software and the MITRE campaigns that exploited it

Tutorial video: http://youtu.be/Asfp6X9cHwQ
