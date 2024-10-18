use [PortfolioProject_MarketingAnalytics]

-- Categorize the price into 'Low', 'Medium', 'High', to know in which price range we have most products
select *,
case 
	when price < 50 then 'Low'
	when Price between 50 and 200 then 'Medium'
	else 'High' 
end as PriceCategory
from [dbo].[products]








