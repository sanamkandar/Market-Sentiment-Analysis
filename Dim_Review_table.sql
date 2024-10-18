
-- Cleaned the Review Text by removing extraspaces from the text.
select ReviewID, [CustomerID], [ProductID], [ReviewDate], [Rating], trim(replace(ReviewText,'  ', ' ')) as ReviewText from [dbo].[customer_reviews]