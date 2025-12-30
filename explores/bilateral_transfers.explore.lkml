include: "/views/bilateral_transfers.view.lkml"
include: "/views/btc_accounts.view.lkml"

explore: bilateral_transfers {
  description: "Bilateral transfers for BTC with account details"
  always_filter: {
    filters: [bilateral_transfers.block_date: "last 7 days"]
  }
  join: btc_accounts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${bilateral_transfers.src_address} = ${btc_accounts.address} ;;
  }
}
