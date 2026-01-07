view: index_ohlcv_minutes {
  derived_table: {
    sql: SELECT row_number() over (order by timestamp) rn, * FROM `elementus-prod-242016.ccdata.index_ohlcv_MINUTES` ;;
  }
dimension: pk {
  type: number
  sql: ${TABLE}.RN ;;
  primary_key: yes
  hidden: yes
}
  dimension: asset_id {
    type: number
    sql: ${TABLE}.ASSET_ID ;;
  }
  dimension: asset_symbol {
    type: string
    sql: ${TABLE}.ASSET_SYMBOL ;;
  }
  dimension: close {
    type: number
    sql: ${TABLE}.CLOSE ;;
  }
  dimension_group: first_message_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.FIRST_MESSAGE_TIMESTAMP ;;
  }
  dimension: first_message_value {
    type: number
    sql: ${TABLE}.FIRST_MESSAGE_VALUE ;;
  }
  dimension: high {
    type: number
    sql: ${TABLE}.HIGH ;;
  }
  dimension_group: high_message_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.HIGH_MESSAGE_TIMESTAMP ;;
  }
  dimension: high_message_value {
    type: number
    sql: ${TABLE}.HIGH_MESSAGE_VALUE ;;
  }
  dimension_group: ingestion_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.INGESTION_TIMESTAMP ;;
  }
  dimension: instrument {
    type: string
    sql: ${TABLE}.INSTRUMENT ;;
  }
  dimension_group: last_message_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LAST_MESSAGE_TIMESTAMP ;;
  }
  dimension: last_message_value {
    type: number
    sql: ${TABLE}.LAST_MESSAGE_VALUE ;;
  }
  dimension: low {
    type: number
    sql: ${TABLE}.LOW ;;
  }
  dimension_group: low_message_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.LOW_MESSAGE_TIMESTAMP ;;
  }
  dimension: low_message_value {
    type: number
    sql: ${TABLE}.LOW_MESSAGE_VALUE ;;
  }
  dimension: market {
    type: string
    sql: ${TABLE}.MARKET ;;
  }
  dimension: open {
    type: number
    sql: ${TABLE}.OPEN ;;
  }
  dimension: quote_volume {
    type: number
    sql: ${TABLE}.QUOTE_VOLUME ;;
  }
  dimension: quote_volume_direct {
    type: number
    sql: ${TABLE}.QUOTE_VOLUME_DIRECT ;;
  }
  dimension: quote_volume_top_tier {
    type: number
    sql: ${TABLE}.QUOTE_VOLUME_TOP_TIER ;;
  }
  dimension: quote_volume_top_tier_direct {
    type: number
    sql: ${TABLE}.QUOTE_VOLUME_TOP_TIER_DIRECT ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.TIMESTAMP ;;
  }
  dimension: total_index_updates {
    type: number
    sql: ${TABLE}.TOTAL_INDEX_UPDATES ;;
  }
  dimension: type {
    type: string
    sql: ${TABLE}.TYPE ;;
  }
  dimension: unit {
    type: string
    sql: ${TABLE}.UNIT ;;
  }
  dimension: volume {
    type: number
    sql: ${TABLE}.VOLUME ;;
  }
  dimension: volume_direct {
    type: number
    sql: ${TABLE}.VOLUME_DIRECT ;;
  }
  dimension: volume_top_tier {
    type: number
    sql: ${TABLE}.VOLUME_TOP_TIER ;;
  }
  dimension: volume_top_tier_direct {
    type: number
    sql: ${TABLE}.VOLUME_TOP_TIER_DIRECT ;;
  }
  measure: count {
    type: count
  }

  measure: price {
    type: average
    sql: ${close} ;;
    value_format_name: usd_0
  }
}
