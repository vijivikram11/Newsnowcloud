{{
  config(
    materialized='view'
  )
}}
with
    survey_data as (

        select id, gender, customertype, typeoftravel, class, satisfaction

        from survey.public.survey_data

    ),

    custtype as (select customertype, customerid from survey.public.dim_customertype),

    typetravel as (select typeid, typeoftravel from survey.public.dim_traveltype),

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
