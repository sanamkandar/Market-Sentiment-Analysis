----select distinct * from [dbo].[customer_journey]

---- CTE for identifying duplicate records
--With Duplicate_Records as (
--select
--[JourneyID],[CustomerID],[ProductID],[VisitDate],[Stage],[Action],
--ROW_NUMBER() over(partition by [CustomerID],[ProductID],[VisitDate],[Stage],[Action] order by [JourneyID]) as Duplicate 
--from [dbo].[customer_journey]
--)
--select * from Duplicate_Records
--where Duplicate>1

with Standardize_Customer_journey_table as
(
select
[JourneyID],[CustomerID],[ProductID],[VisitDate],Upper([Stage]) as stage,[Action],
case 
	when Duration is null then round(AVG(Duration) over(partition by [VisitDate]),1) 
	else Duration
end as Duration,
ROW_NUMBER() over(partition by [CustomerID],[ProductID],[VisitDate], [Stage], [Action] order by [JourneyID]) as Cardinality
from [dbo].[customer_journey]
)
select * from Standardize_Customer_journey_table
where Cardinality = 1