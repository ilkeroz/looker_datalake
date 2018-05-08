view: node {
  sql_table_name: hive.{{ _user_attributes['datalake_platform'] }}.dwh_node ;;
  suggestions: yes


  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: nodename {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.nodeid ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: pdprofileid {
    type: string
    sql: ${TABLE}.pdprofileid ;;
  }

  dimension: pdprofilename {
    type: string
    sql: ${TABLE}.pdprofilename ;;
  }

  dimension: publickey {
    type: string
    sql: ${TABLE}.publickey ;;
  }

  dimension: remotenetwork {
    type: string
    sql: ${TABLE}.remotenetwork ;;
  }

  dimension: serialnumber {
    type: string
    sql: ${TABLE}.serialnumber ;;
  }

  dimension: server {
    type: string
    sql: ${TABLE}.server ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: siteid {
    type: string
    sql: ${TABLE}.siteid ;;
  }

  dimension: softwareversion {
    type: string
    sql: ${TABLE}.softwareversion ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

}
