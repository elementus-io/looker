view: btc_bilateral_transfers {
  sql_table_name: `elementus-prod-242016.btcprod.btc_bilateral_transfers` ;;

  dimension: amt {
    type: number
    sql: ${TABLE}.amt ;;
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
  dimension: max_src_address {
    type: string
    sql: ${TABLE}.max_src_address ;;
  }
  dimension: n {
    type: number
    sql: ${TABLE}.n ;;
  }
  dimension: output_cnt {
    type: number
    sql: ${TABLE}.output_cnt ;;
  }
  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }
  dimension: txid {
    type: string
    sql: ${TABLE}.txid ;;
  }
  measure: count {
    type: count
  }
}
