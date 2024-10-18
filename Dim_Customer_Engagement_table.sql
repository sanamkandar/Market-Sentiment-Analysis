

-- Cleaned up the data for content type, and splited column for views and click 
select
[EngagementID],
[ContentID],
REPLACE(CONCAT(upper(left(ContentType, 1)), lower(right(ContentType, len(ContentType)-1))),'Socialmedia','Social Media') as ContentType,
[EngagementDate],
[CampaignID],
[ProductID],
[Likes],
LEFT(ViewsClicksCombined, CHARINDEX('-',ViewsClicksCombined)-1) as Views,
SUBSTRING(ViewsClicksCombined,CHARINDEX('-',ViewsClicksCombined)+1, len(ViewsClicksCombined)) as Clicks
from [dbo].[engagement_data]
where ContentType <> 'Newsletter' -- filter out the records which are newsletter, as these are relevent for our analysis