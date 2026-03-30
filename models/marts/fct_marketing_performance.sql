with combined as (
    select * from {{ ref('stg_fb_ads') }}
    union all
    select * from {{ ref('stg_google_ads') }}
)

select
    ad_date,
    platform,
    device,
    sum(costs) as total_costs,
    sum(clicks) as total_clicks,
    -- KPI: Cost Per Click
    sum(costs) / nullif(sum(clicks), 0) as cpc,
    -- KPI: Click-Through Rate
    (sum(clicks) * 1.0) / nullif(sum(impressions), 0) as ctr
from combined
group by 1, 2, 3
