view: entity_transfers {

  derived_table: {
    sql: SELECT row_number() over(order by timestamp, txid) as rn , * FROM `elementus-prod-242016.spotlight.entity_transfers` ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }
  dimension: block {
    type: number
    sql: ${TABLE}.block ;;
  }
  dimension: blockchain {
    type: string
    sql: ${TABLE}.blockchain ;;
  }
  dimension: cluster {
    type: string
    sql: ${TABLE}.cluster ;;
  }
  dimension: counterparty_entity_type_parent {
    type: string
    sql: ${TABLE}.counteparty_entity_type_parent ;;
  }
  dimension: counterparty_cluster {
    type: string
    sql: ${TABLE}.counterparty_cluster ;;
  }
  dimension: counterparty_entity {
    type: string
    sql: ${TABLE}.counterparty_entity ;;
  }
  dimension: counterparty_entity_display_name {
    type: string
    sql: ${TABLE}.counterparty_entity_display_name ;;
  }
  dimension: counterparty_entity_type {
    type: string
    sql: ${TABLE}.counterparty_entity_type ;;
  }
  dimension: counterparty_entity_type_display_name {
    type: string
    sql: ${TABLE}.counterparty_entity_type_display_name ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year, day_of_week,day_of_month,day_of_year,week_of_year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: direction {
    type: string
    sql: ${TABLE}.direction ;;
  }
  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
  }
  dimension: entity_display_name {
    type: string
    sql: ${TABLE}.entity_display_name ;;
  }
  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }
  dimension: entity_type_display_name {
    type: string
    sql: ${TABLE}.entity_type_display_name ;;
  }
  dimension: entity_type_parent {
    type: string
    sql: ${TABLE}.entity_type_parent ;;
  }
  dimension: is_altcoin {
    type: yesno
    sql: ${TABLE}.is_altcoin ;;
  }
  dimension: is_counterparty_known {
    type: yesno
    sql: ${TABLE}.is_counterparty_known ;;
  }
  dimension: is_entity_known {
    type: yesno
    sql: ${TABLE}.is_entity_known ;;
  }
  dimension: is_erc20 {
    type: yesno
    sql: ${TABLE}.is_erc20 ;;
  }
  dimension: is_internal_tx {
    type: yesno
    sql: ${TABLE}.is_internal_tx ;;
  }
  dimension: is_stablecoin {
    type: yesno
    sql: ${TABLE}.is_stablecoin ;;
  }

  dimension: pk {
    type: number
    sql: ${TABLE}.rn ;;
    primary_key: yes
    hidden: yes

  }
  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }
  dimension_group: timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year,month_name]
    convert_tz: no
    datatype: date
    sql: date(${TABLE}.timestamp) ;;
  }
  # dimension: timestamp {
  #   type: number
  #   sql: ${TABLE}.timestamp ;;
  # }
  dimension: token_address {
    type: string
    sql: ${TABLE}.token_address ;;
  }
  dimension: token_name {
    type: string
    sql: ${TABLE}.token_name ;;
  }
  dimension: txid {
    type: string
    sql: ${TABLE}.txid ;;
  }
  dimension: unique_symbol {
    type: string
    sql: ${TABLE}.unique_symbol ;;
  }
  dimension: usd {
    type: number
    sql: ${TABLE}.usd ;;
  }
  dimension: usd_exchange_rate {
    type: number
    sql: ${TABLE}.usd_exchange_rate ;;
  }
  measure: count {
    group_label: "counts"
    type: count
    drill_fields: [drill_down_fields*]
  }
  measure: total_unique_entities {
    group_label: "counts"
    type: count_distinct
    sql: ${entity} ;;
    drill_fields: [drill_down_fields*]
  }
  measure: usd_total {
    group_label: "totals"
    type: sum
    sql: ${usd} ;;
  }
  measure: unique_tokens {
    description: "This is count of unique tokens"
    group_label: "counts"
    type: count_distinct
    sql: ${token_name} ;;
  }
  set: drill_down_fields {
    fields: [unique_symbol, counterparty_entity_display_name, entity_display_name, counterparty_entity_type_display_name, entity_type_display_name]
  }
}
