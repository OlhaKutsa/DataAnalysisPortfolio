with Gg_Fb_CTE as (
select fabd.ad_date,
fc.campaign_name,
fa.adset_name,
fabd.spend,
fabd.impressions,
fabd.reach,
fabd.clicks,
fabd.leads,
fabd.value,
'Facebook_Ads' as media_source
from facebook_ads_basic_daily fabd 
join facebook_adset fa on fa.adset_id = fabd.adset_id
join facebook_campaign fc on fc.campaign_id = fabd.campaign_id
union all
select ad_date,
campaign_name, 
adset_name, 
spend,
impressions,
reach,
clicks,
leads,
value, 
'Google_Ads' as media_source
from google_ads_basic_daily gabd)
select
ad_date,
media_source,
campaign_name, 
adset_name,
sum(spend) as total_spend,
sum(impressions) as total_impressions,
sum(clicks) as total_clicks,
sum(value) as total_value,
round (sum (value) :: numeric / sum (spend) :: numeric, 2) as ROMI,
sum (spend) / sum (clicks) as CPC,
1000 * sum (spend) / sum (impressions) as CPM,
100 * sum (clicks) :: numeric / sum (impressions) as CTR
from Gg_Fb_CTE
where spend > 0 and clicks > 0 and impressions > 0
group by ad_date, media_source, campaign_name, adset_name;