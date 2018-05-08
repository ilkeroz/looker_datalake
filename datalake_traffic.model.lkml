connection: "presto-dev3"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

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
