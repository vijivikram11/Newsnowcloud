with passenger as (

  select ID,GENDER,CUSTOMERTYPE,TYPEOFTRAVEL,CLASS,SATISFACTION from SURVEY.PUBLIC.SURVEY_DATA
  
), 

custtype as (

  select CUSTOMERTYPE from SURVEY.PUBLIC.DIM_CUSTOMERTYPE
  
), 

traveltype as (

  select TYPEOFTRAVEL from SURVEY.PUBLIC.DIM_TRAVELTYPE
  
), 
TargetResults as (
      passenger.ID,
      passenger.GENDER,
      custtype.CUSTOMERID as CUSTOMERTYPEID, 
      traveltype.TYPEID as TYPEOFTRAVELID,
      passenger.CLASS,
      passenger.SATISFACTION
      from passenger
    left join custtype
      on passenger.CUSTOMERTYPE=custtype.CUSTOMERTYPE
    left join traveltype
      on passenger.TYPEOFTRAVEL=traveltype.TYPEID  
 )

 select * from TargetResults