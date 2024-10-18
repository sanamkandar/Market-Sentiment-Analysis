
-- join customer and product tables for full combined information of customers

select Customer.CustomerID, Customer.CustomerName, Customer.Email, Customer.Gender, Customer.Age, Geography.City, Geography.Country, Customer.GeographyID,
case	
	when [Geography].Country in ('UK','France','Netherlands','Belgium') then 'Western Europe'
	when [Geography].Country in ('Spain','Italy') then 'Southern  Europe'
	when [Geography].Country in ('Germany','Switzerland','Austria') then 'Central  Europe'
	when [Geography].Country in ('Sweden') then 'Northern   Europe'
	else 'NA'
end as ContinentRegion
from [dbo].[customers] as Customer
left join [dbo].[geography] as [Geography]
on Customer.GeographyID = [Geography].GeographyID

