view: asset_prices_minutely_ccdata {
  sql_table_name: `elementus-prod-242016.pricing.asset_prices_minutely_ccdata` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: asset_id {
    type: number
    sql: ${TABLE}.asset_id ;;
  }
  dimension_group: block {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.block_date ;;
  }
  dimension: blockchain {
    type: string
    sql: ${TABLE}.blockchain ;;
  }
  dimension: close {
    type: number
    sql: ${TABLE}.close ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension_group: dt {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dt ;;
  }
  dimension: high {
    type: number
    sql: ${TABLE}.high ;;
  }
  dimension: instrument {
    type: string
    sql: ${TABLE}.instrument ;;
  }
  dimension: low {
    type: number
    sql: ${TABLE}.low ;;
  }
  dimension: open {
    type: number
    sql: ${TABLE}.open ;;
  }
  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }
  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }
  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }
  dimension: volume {
    type: number
    sql: ${TABLE}.volume ;;
  }
  dimension: volume_24h {
    type: number
    sql: ${TABLE}.volume_24h ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
