select
    Day as ad_date,
    campaign_name as campaign_name,
    costs as spend,
    impressions as impressions,
    Clicks as clicks,
    device_type as device,
    'Google' as platform
from {{ source('ad_data', 'google_ads') }}
