include: "/views/bytecode_demo/eth_daily_entity_balances.view.lkml"
include: "/views/bytecode_demo/dates.view.lkml"

# access_grant: can_see_balance {
#   user_attribute: can_see_balance
#   allowed_values: [ "yes" ]
# }



explore: token_supplies {
  description: "This is the description for Token Supplies"
  label: "Token-Label"
  from: eth_daily_entity_balances

  join: dates {
    type: left_outer
    sql_on: ${dates.date_raw} = ${token_supplies.date_raw} ;;
    relationship: many_to_one
  }

  join: tokens_with_negative_balance {
    from: eth_daily_entity_balances
    type: left_outer
    sql_on: ${token_supplies.unique_symbol} = ${tokens_with_negative_balance.unique_symbol} and
    round(${token_supplies.balance},4) < 1;;
    relationship: one_to_one
  }


}
