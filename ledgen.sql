-- 1.-
SELECT SUM(amount)  AS revenue, monthname(charged_datetime) AS MONTH FROM billing 
WHERE charged_datetime > "2012-02-28" AND charged_datetime < "2012-04-01";
-- 2.-
SELECT clients.client_id, SUM(billing.amount) AS revenue
FROM clients
JOIN billing ON clients.client_id = billing.client_id
WHERE clients.client_id = 2; 
-- 3.- 
SELECT sites.domain_name AS website, clients.client_id
FROM sites
JOIN clients ON clients.client_id = sites.client_id
WHERE clients.client_id = 10;
-- 4.-
SELECT client_id, COUNT(site_id) AS number_of_websites, monthname(created_datetime) AS month_created, year(created_datetime) AS year_created
FROM sites WHERE client_id = 1 GROUP BY site_id;
SELECT client_id, COUNT(site_id) AS number_of_websites, monthname(created_datetime) AS month_created, year(created_datetime) AS year_created
FROM sites WHERE client_id = 20 GROUP BY site_id;
-- 5.-
SELECT sites.domain_name AS website, COUNT(leads.leads_id) AS number_of_leads, leads.registered_datetime AS date_generated
FROM sites
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= "2011-01-01" AND leads.registered_datetime <= "2011-02-15" GROUP BY sites.site_id;
-- 6.-
SELECT CONCAT(clients.first_name," ",clients.last_name) AS client_name, COUNT(leads.leads_id) AS number_of_leads
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= "2011-01-01" AND leads.registered_datetime <= "2011-12-31" GROUP BY clients.client_id;
-- 7.- 
SELECT CONCAT(clients.first_name," ",clients.last_name) AS client_name, COUNT(leads.leads_id) AS number_of_leads, monthname(leads.registered_datetime) as month_generated
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= "2011-01-01" AND leads.registered_datetime < "2011-07-01" GROUP BY leads.registered_datetime;
-- 8.-
SELECT CONCAT(clients.first_name," ",clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.leads_id) AS number_of_leads, date_format(leads.registered_datetime,' %M %d, %Y') as month_generated
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime >= "2011-01-01" AND leads.registered_datetime < "2011-12-31" GROUP BY sites.domain_name; 

SELECT CONCAT(clients.first_name," ",clients.last_name) AS client_name, sites.domain_name AS website, COUNT(leads.leads_id) AS number_of_leads
FROM clients
left JOIN sites ON clients.client_id = sites.client_id
left JOIN leads ON sites.site_id = leads.site_id
GROUP BY sites.domain_name; 
-- 9.-
SELECT CONCAT(clients.first_name," ",clients.last_name) AS client_name, SUM(billing.amount) AS Total_renenue, monthname(billing.charged_datetime) as month_charged, year(billing.charged_datetime) as year_charged
FROM billing 
JOIN clients ON clients.client_id = billing.client_id
GROUP BY MONTH(billing.charged_datetime), year(billing.charged_datetime), clients.client_id ORDER BY year_charged, client_name;
-- 10.- 
SELECT CONCAT(clients.first_name," ",clients.last_name) AS client_name, GROUP_CONCAT(sites.domain_name,"/" SEPARATOR ' ') AS sites
FROM clients
left JOIN sites ON sites.client_id = clients.client_id
GROUP BY client_name;