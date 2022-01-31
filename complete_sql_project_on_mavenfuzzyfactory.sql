#1)
select 
   utm_source, 
   utm_campaign,
   http_referer,
   count(*),
   count(*)/(select sum(count(*)) over() from mavenfuzzyfactory.website_sessions where created_at <"2012-04-12") as   Total_Percentage 
from 
   mavenfuzzyfactory.website_sessions  
where 
   created_at < "2012-04-12" 
group by 
   utm_source, utm_campaign , http_referer ;
   
#2)
select  
	count(distinct website_sessions.website_session_id) as visit_people, 
    count(order_id) as order_converted,
    count(orders.website_session_id)/count(website_sessions.website_session_id)*100 as conversion_rate
from 
    mavenfuzzyfactory.website_sessions 
left join 
    mavenfuzzyfactory.orders on website_sessions.website_session_id = orders.website_session_id
where 
	website_sessions.created_at < "2012-04-14"
       and utm_source = 'gsearch'
	   and utm_campaign = "nonbrand";
#3)
SELECT 
    MIN(DATE(created_at)) AS week_start_date,
    COUNT(DISTINCT website_sessions.website_session_id) AS sessions
FROM
    mavenfuzzyfactory.website_sessions
WHERE
    created_at 
    between '2012-04-15' and '2012-05-10' 
	AND utm_source = 'gsearch'
	AND utm_campaign = 'nonbrand'
GROUP BY 
	yearweek(created_at);
    
#4)
select 
     website_sessions.device_type, 
     count(distinct website_sessions.website_session_id) as visited_peoples, 
     count(distinct orders.order_id) as orders, 
     count(distinct orders.order_id)/count(distinct website_sessions.website_session_id) * 100 as conversion_rate
from 
     mavenfuzzyfactory.website_sessions 
left join 
	 mavenfuzzyfactory.orders on website_sessions.website_session_id=orders.website_session_id 
where 
     website_sessions.created_at < "2012-05-11" 
group by 
	 device_type;
     
#5)
select 
     MIN(DATE(website_sessions.created_at)) AS week_start_date,
     device_type, 
     count(distinct website_sessions.website_session_id) as visited_peoples 
     
from 
     mavenfuzzyfactory.website_sessions 
left join
     mavenfuzzyfactory.orders on website_sessions.website_session_id=orders.website_session_id 
where 
     website_sessions.created_at between '2012-05-19' and '2012-06-09'
     and website_sessions.device_type = 'desktop'
     and website_sessions.utm_source ='gsearch'
     and website_sessions.utm_campaign = 'nonbrand'  
group by 
	 YEARWEEK(website_sessions.created_at),device_type;
    

