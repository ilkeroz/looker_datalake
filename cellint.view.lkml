view: cellint {

    derived_table: {
      sql:
      select time, section, speed_mph
      from   hive.{{ _user_attributes['datalake_platform'] }}.cellint_sample
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
