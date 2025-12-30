connection: "bigquery"

include: "/views/*.view.lkml"

include: "/views/spotlight/entity_transfers.view.lkml"

include: "/explores/eth_daily_entity_balances.explore.lkml"
include: "/explores/bilateral_transfers.explore.lkml"

explore: entity_transfers {}
