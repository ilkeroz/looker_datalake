view: site {

    derived_table: {
      sql:
       select s.*
       from   hive.{{ _user_attributes['datalake_platform'] }}.dwh_site s
       where  s.siteid in
       (
       select siteid
       from   hive.{{ _user_attributes['datalake_platform'] }}.dwh_site
       where  orgid in
              (
              select orgid
              from   hive.{{ _user_attributes['datalake_platform'] }}.dwh_user
              where  email='{{ _user_attributes['datalake_email'] }}'
              union
              select customer_orgid as orgid
              from   hive.{{ _user_attributes['datalake_platform'] }}.dwh_partner
              where  partner_orgid in
                     (
                     select orgid as partner_orgid
                     from   hive.{{ _user_attributes['datalake_platform'] }}.dwh_user
                     where  email='{{ _user_attributes['datalake_email'] }}'
                     )
              )
       )
       or upper('{{ _user_attributes['datalake_email'] }}') = 'ALL'
       ;;
      }

      suggestions: yes

      dimension: altitude {
        type: string
        sql: ${TABLE}.altitude ;;
      }

      dimension: city {
        type: string
        sql: ${TABLE}.city ;;
      }

      dimension: country {
        type: string
        sql: ${TABLE}.country ;;
      }

      dimension: created {
        type: string
        sql: ${TABLE}.created ;;
      }

      dimension: latitude {
        type: string
        sql: ${TABLE}.latitude ;;
      }

      dimension: longitude {
        type: string
        sql: ${TABLE}.longitude ;;
      }

      dimension: sitename {
        type: string
        sql: ${TABLE}.name ;;
      }

      dimension: orgid {
        type: string
        sql: ${TABLE}.orgid ;;
      }

      dimension: postal_code {
        type: string
        sql: ${TABLE}.postal_code ;;
      }

      dimension: region_code {
        type: string
        sql: ${TABLE}.region_code ;;
      }

      dimension: siteid {
        type: string
        sql: ${TABLE}.siteid ;;
      }

      dimension: state {
        type: string
        sql: ${TABLE}.state ;;
      }

      dimension: street1 {
        type: string
        sql: ${TABLE}.street1 ;;
      }

      dimension: street2 {
        type: string
        sql: ${TABLE}.street2 ;;
      }

      dimension: time_zone {
        type: string
        sql: ${TABLE}.time_zone ;;
      }

  }
