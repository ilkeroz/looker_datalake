view: cellint {

    derived_table: {
      sql:
      select
        concat('20',substr(time,7,2),'-',substr(time,1,2),'-',substr(time,4,2),substr(time,9)) as time,
        section,
        speed_mph
      from   hive.{{ _user_attributes['datalake_platform'] }}.cellint_tab
      where  time != 'Time'
      ;;
    }

    suggestions: yes

    dimension: speed_mph {
      type: number
      sql: ${TABLE}.speed_mph ;;
    }

    dimension: section {
      type: string
      sql: ${TABLE}.section ;;
    }

    dimension: time {
      type: string
      sql: ${TABLE}.time ;;
    }

    dimension_group: time_details {
      type: time
      timeframes: []
      sql: date_parse(${TABLE}.time,'%Y-%m-%d %H:%i:%s') ;;
    }

    measure: avg_speed {
      type: average
      sql: ${speed_mph} ;;
    }


  }
