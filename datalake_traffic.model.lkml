connection: "presto-dev3"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: cellint {
  join: site {
    sql_on: ${cellint.siteid} = ${site.siteid} ;;
    relationship: many_to_one
    type: inner
  }
}

explore: site {}

explore: node {}

explore: aggregation_traffic_events {
    join: site {
      sql_on: ${aggregation_traffic_events.siteid} = ${site.siteid} ;;
      relationship: many_to_one
      type: inner
    }
    join: node {
      sql_on: ${aggregation_traffic_events.nodeid} = ${node.nodeid} ;;
      relationship: many_to_one
      type: inner
    }
  }
