select 
  Application.software, Application.description, Software.vendor, Software.name, cve.id, cve.impactScore, cve.url
from 
  Application, Software, vulnerability, cve
where 
  Application.software = Software.id and
  Software.vendor = vulnerability.vendor and Software.name = vulnerability.software and 
  Software.id <> 'linux_kernel' and
  vulnerability.cve = cve.id