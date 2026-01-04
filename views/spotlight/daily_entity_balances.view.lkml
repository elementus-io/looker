view: daily_entity_balances {
  # We use a PDT to materialize the view for performance
  derived_table: {
    sql: SELECT row_number() over(order by date, entity, unique_symbol) as rn, * FROM `elementus-prod-242016.spotlight.daily_entity_balances` ;;
    datagroup_trigger: daily_entity_balances_datagroup
    partition_keys: ["date"]
    cluster_keys: ["entity", "unique_symbol"]
    increment_key: "date"
    increment_offset: 3 # Rebuild last 3 days to catch late arriving data
  }

  dimension: pk {
    type: number
    sql: ${TABLE}.rn ;;
    primary_key: yes
    hidden: yes
  }

  dimension: token_name {
    type: string
    sql: ${TABLE}.token_name ;;
  }

  dimension: symbol {
    type: string
    sql: ${TABLE}.symbol ;;
  }

  dimension: unique_symbol {
    type: string
    sql: ${TABLE}.unique_symbol ;;
  }

  dimension: is_stablecoin {
    type: yesno
    sql: ${TABLE}.is_stablecoin ;;
  }

  dimension: is_erc20 {
    type: yesno
    sql: ${TABLE}.is_erc20 ;;
  }

  dimension: is_altcoin {
    type: yesno
    sql: ${TABLE}.is_altcoin ;;
  }

  dimension: blockchain {
    type: string
    sql: ${TABLE}.blockchain ;;
  }

  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
  }

  dimension: entity_display_name {
    type: string
    sql: ${TABLE}.entity_display_name ;;
    label: "Entity Name"
  }

  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }

  dimension: entity_type_parent {
    type: string
    sql: ${TABLE}.entity_type_parent ;;
  }

  dimension: entity_type_display_name {
    type: string
    sql: ${TABLE}.entity_type_display_name ;;
    label: "Entity Type Name"
  }

  dimension: is_entity_known {
    type: yesno
    sql: ${TABLE}.is_entity_known ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  dimension: usd_balance {
    type: number
    sql: ${TABLE}.usd_balance ;;
  }

  dimension: usd_exchange_rate {
    type: number
    sql: ${TABLE}.usd_exchange_rate ;;
  }

  # Measures
  measure: total_balance {
    type: sum
    sql: ${balance} ;;
    value_format_name: decimal_2
  }

  measure: total_usd_balance {
    type: sum
    sql: ${usd_balance} ;;
    value_format_name: usd
  }

  measure: count {
    type: count
  }
}
