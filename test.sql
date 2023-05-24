with
    survey_data as (

        select * from {{ ref('sql1') }}

        from survey.public.survey_data

    ),

    custtype as (
        select * from {{ ref('sql2') }}
    ),

    
    final as (

        select
            survey_data.id,
            survey_data.gender,
            survey_data.class,
            survey_data.satisfaction,
            custtype.customerid as customertypeid

        from survey_data

        left join custtype using (customertype)

    )

select *
from final
