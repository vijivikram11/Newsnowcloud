with
    survey_data as (

        select id, gender, customertype, typeoftravel, class, satisfaction

        from SURVEY.PUBLIC.SURVEY_DATA

    ),

    Custtype as (

        select 
            CUSTOMERTYPE,
            customerid
        from SURVEY.PUBLIC.DIM_CUSTOMERTYPE

    ),

    TypeTravel as (

        select
            Typeid,
            TypeofTravel
        from SURVEY.PUBLIC.DIM_TRAVELTYPE

    ),

    final as (

        select
            survey_data.id,
            survey_data.gender,
            survey_data.class,
            survey_data.satisfaction,
            custtype.customerid as CUSTOMERTYPEID,
            
        from survey_data

        left join custtype using (CUSTOMERTYPE)

    )

select *
from final
