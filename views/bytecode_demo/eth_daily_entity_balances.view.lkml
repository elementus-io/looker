view: eth_daily_entity_balances {


 sql_table_name: `elementus-prod-242016.ds.eth_daily_entity_balances` ;;

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year,month_name]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: entity_name_symbol {
    type: string
    sql: ${entity}||'-'||${symbol} ;;
  }
  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }
  dimension: is_entity_known {
    type: yesno
    sql: ${TABLE}.is_entity_known ;;
  }
  dimension: is_erc20 {
    type: yesno
    sql: ${TABLE}.is_erc20 ;;
  }
  dimension: is_stablecoin {
    type: yesno
    sql: ${TABLE}.is_stablecoin ;;
  }


  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }
  dimension: token_address {
    type: string
    sql: ${TABLE}.token_address ;;
  }
  dimension: token_name {
    type: string
    sql: ${TABLE}.token_name ;;
  }
  dimension: unique_symbol {
    primary_key: yes
    type: string
    sql: ${TABLE}.unique_symbol ;;
  }
  dimension: usd_balance {
    type: number
    sql: ${TABLE}.usd_balance ;;
  }
  dimension: usd_exchange_rate {
    type: number
    sql: ${TABLE}.usd_exchange_rate ;;
  }

  measure: avg_usd_exchange_rate {
    type: average
    sql: ${usd_exchange_rate} ;;
  }
  measure: count {
    group_label: "counts"
    type: count
    drill_fields: [token_name]
  }

  measure: supply {
    group_label: "Supply Metrics"
    type: sum
    sql: ${balance} ;;
  }
  measure: total_unique_entities {
    group_label: "counts"
    type: count_distinct
    sql: ${entity} ;;
    drill_fields: [drill_down_fields*]
  }

  measure: usd_supply {
    group_label: "Supply Metrics"
    type: sum
    sql: ${usd_balance} ;;
  }



  measure: unique_tokens {
    description: "This is count of unique tokens"
    group_label: "counts"
    type: count_distinct
    sql: ${token_name} ;;
  }
set: drill_down_fields {
  fields: [token_name, unique_symbol, entity]
}
}
