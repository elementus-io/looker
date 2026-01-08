connection: "bigquery"

datagroup: daily_entity_balances_datagroup {
  sql_trigger: SELECT MAX(date) FROM `elementus-prod-242016.spotlight.daily_entity_balances` ;;
  max_cache_age: "24 hours"
}

include: "/views/spotlight/entity_transfers.view.lkml"
include: "/views/spotlight/daily_entity_balances.view.lkml"
include: "/views/public_data/inputs.view.lkml"
include: "/views/public_data/outputs.view.lkml"

include: "/explores/entity_transfers.explore.lkml"
include: "/explores/daily_entity_balances.explore.lkml"
include: "/explores/btc_outputs.explore.lkml"

include: "/dashboards/cex_balances.dashboard.lookml"
