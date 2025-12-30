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
