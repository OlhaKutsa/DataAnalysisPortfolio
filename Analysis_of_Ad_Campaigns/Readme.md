***2 Efficiency Analysis of Advertising Campaigns on Facebook and Google Ads Platforms***


The main task was to compute various performance metrics of campaigns using SQL queries by merging data from both sources and utilizing different metrics such as spend, impressions, and clicks, among others. Data for further analysis was loaded into Google Looker for visualization.


Main Steps:
1. **Data Merge:** The query begins with creating a common table expression (CTE) that merges data from Facebook and Google Ads tables using the `UNION ALL` operation.
   
2. **Metrics Computation**: After merging the data, various campaign performance metrics are computed, including total spend, impressions, clicks, value, and others. Each metric is calculated using aggregation functions like `SUM`, `ROUND`, and computed expressions.


3. **Data Filtering**: To avoid division by zero and consider only significant data, `WHERE` filters are applied to exclude cases where spend, impressions, or clicks are zero.


4. **Results Grouping**: After computing the metrics, the data is grouped by date, platform (Facebook or Google Ads), campaign_name, and adset_name using the `GROUP BY` operator.


5. Data for further analysis was loaded into Google Looker, which provides visualization capabilities. Subsequently, a dashboard was created with three charts:
   a. Combined Chart: This chart contains the dates of ad displays on the horizontal axis and the sum of ad spend and ROMI for each month on two vertical axes. The horizontal axis is sorted from oldest to newest date.
   b. Line Chart: This chart displays the number of active campaigns each month for ad displays.
   c. Table with Columns and Heat Maps: In this table, campaign names are used as dimensions, and metrics such as total Ad Spend, CPC, CPM, CTR, and ROMI are used as measures.
   Filters were also added to the report by campaign name and ad date to provide the ability for detailed analysis and data filtering.

