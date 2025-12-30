# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: bilateral_transfers {
#   hidden: yes
#     join: bilateral_transfers__src_addresses {
#       view_label: "Bilateral Transfers: Src Addresses"
#       sql: LEFT JOIN UNNEST(${bilateral_transfers.src_addresses}) as bilateral_transfers__src_addresses ;;
#       relationship: one_to_many
#     }
# }
view: bilateral_transfers {
  sql_table_name: `elementus-prod-242016.btcprod.bilateral_transfers` ;;

  dimension: amount {
    # hidden: yes
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_amount {
    type: sum
    value_format_name: usd
    sql: ${amount} ;;
    drill_fields: [txid,block_date,block,amount]
  }

  # measure: total_amount_sql {
  #   type: number
  #   value_format_name: usd
  #   sql: SUM(${amount}) ;;
  # }


  dimension: block {
    type: number
    sql: ${TABLE}.block ;;
  }
  dimension_group: block {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.block_date ;;
  }
  dimension: dst_address {
    type: string
    sql: ${TABLE}.dst_address ;;
  }
  dimension: input_cnt {
    type: number
    sql: ${TABLE}.input_cnt ;;
  }
  dimension: is_coinjoin {
    type: number
    sql: ${TABLE}.is_coinjoin ;;
  }
  dimension: n {
    type: number
    sql: ${TABLE}.n ;;
  }
  dimension: output_cnt {
    type: number
    sql: ${TABLE}.output_cnt ;;
  }
  dimension: selfchange_address {
    type: number
    sql: ${TABLE}.selfchange_address ;;
  }
  dimension: src_address {
    type: string
    sql: ${TABLE}.src_address ;;
  }
  dimension: src_addresses {
    hidden: yes
    sql: ${TABLE}.src_addresses ;;
  }
  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }
  dimension: txfee {
    type: number
    sql: ${TABLE}.txfee ;;
  }
  dimension: txid {
    type: string
    sql: ${TABLE}.txid ;;
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT( ${txid} , '_', ${src_address}) ;;
  }

  measure: count {
    type: count
  }

}

# view: bilateral_transfers__src_addresses {

#   dimension: bilateral_transfers__src_addresses {
#     type: string
#     sql: bilateral_transfers__src_addresses ;;
#   }
# }
