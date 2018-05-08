view: aggregation_traffic_events {

   derived_table: {
    sql:
      select siteid,nodeid,aggregation_type,eventcnt,eventid,eventtype,
             eventname,objectclass,startdt,enddt,
             avgvelocity,medianvelocity,p85velocity,avgdwell,startdt_utc,enddt_utc,
             date(startday) as startday
      from   hive.{{ _user_attributes['datalake_platform'] }}.dwh_aggregation_traffic_events e
      ;;
    }

    suggestions: yes

    dimension: avgvelocity {
      type: number
      sql: ${TABLE}.avgvelocity ;;
    }

    dimension: medianvelocity {
      type: number
      sql: ${TABLE}.medianvelocity ;;
    }

    dimension: p85velocity {
      type: number
      sql: ${TABLE}.p85velocity ;;
    }

    dimension: avgdwell {
      type: number
      sql: ${TABLE}.avgdwell ;;
    }

    dimension: startdt_utc {
      type: string
      sql: ${TABLE}.startdt_utc ;;
    }

    dimension: enddt_utc {
      type: string
      sql: ${TABLE}.enddt_utc ;;
    }

    dimension: aggregation_type {
      type: string
      sql: ${TABLE}.aggregation_type ;;
    }

    dimension: enddt {
      type: string
      sql: ${TABLE}.enddt ;;
    }

    dimension: eventcnt {
      type: number
      sql: ${TABLE}.eventcnt ;;
    }

    dimension: eventid {
      type: string
      sql: ${TABLE}.eventid ;;
    }

    dimension: eventname {
      type: string
      sql: ${TABLE}.eventname ;;
    }

    dimension: eventtype {
      type: string
      sql: ${TABLE}.eventtype ;;
    }

    dimension: nodeid {
      type: string
      sql: ${TABLE}.nodeid ;;
    }

    dimension: objectclass {
      type: string
      sql: ${TABLE}.objectclass ;;
    }

    dimension: siteid {
      type: string
      sql: ${TABLE}.siteid ;;
    }

    dimension: startday {
      type: date
      sql: ${TABLE}.startday ;;
    }

    dimension: startdt {
      type: string
      sql: ${TABLE}.startdt ;;
    }

    dimension_group: time_details {
      type: time
      timeframes: []
      sql: date_parse(${TABLE}.startdt,'%Y-%m-%d %H:%i:%s') ;;
    }

    measure: sum_eventcnt {
      type: sum
      sql: ${eventcnt} ;;
    }

    measure: avg_velocity {
      type: average
      sql: ${avgvelocity} ;;
    }

    measure: avg_dwell {
      type: average
      sql: ${avgdwell} ;;
    }

}
