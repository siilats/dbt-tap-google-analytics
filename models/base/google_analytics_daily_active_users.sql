with source as (

    select * from {{var('schema')}}.daily_active_users

),

renamed as (

    select
        -- dimensions
        ga_date::date as report_date,

        substring(ga_date from 1 for 4) as report_year,
        substring(ga_date from 5 for 2) as report_month,
        substring(ga_date from 7 for 2) as report_day,

        -- metrics
        ga_1day_users as daily_active_users

    from source

)

select * from renamed
