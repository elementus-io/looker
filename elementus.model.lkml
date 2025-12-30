connection: "bigquery"

include: "/views/*.view.lkml"

include: "/views/spotlight/entity_transfers.view.lkml"

include: "/explores/eth_daily_entity_balances.explore.lkml"


explore: bilateral_transfers {
  always_filter: {
    filters: [bilateral_transfers.block_date: "last 7 days"]
  }
  join: btc_accounts {
    type: full_outer
    relationship: many_to_one
    sql_on: ${bilateral_transfers.src_address} = ${btc_accounts.address} ;;
  }
}
#  adding commit comments

explore: entity_transfers {}
