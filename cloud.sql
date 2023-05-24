with TargetResults as (
      passenger.ID,
      passenger.GENDER,
      custtype.CUSTOMERID as CUSTOMERTYPEID, 
      traveltype.TYPEID as TYPEOFTRAVELID,
      passenger.CLASS,
      passenger.SATISFACTION,
      from survey.public.survey_data passenger
    left join survey.public.Dim_CustomerType custtype
      on passenger.CUSTOMERTYPE=custtype.CUSTOMERTYPE
    left join survey.public.Dim_TravelType traveltype
      on passenger.TYPEOFTRAVEL=traveltype.TYPEID  
 )

 select * from TargetResults