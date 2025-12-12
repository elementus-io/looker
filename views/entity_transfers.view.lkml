view: entity_transfers {
  sql_table_name: `spotlight.entity_transfers` ;;

  # Dimensions
  dimension: entity {
    sql: ${TABLE}.entity ;;
  }

  dimension: counterparty_entity {
    sql: ${TABLE}.counterparty_entity ;;
  }

  dimension: blockchain {
    sql: ${TABLE}.blockchain ;;
  }

  dimension_group: transfer_time {
    type: time
    timeframes: [date, week, month]
    sql: TIMESTAMP_SECONDS(${TABLE}.timestamp) ;;
  }

  dimension: direction {
    sql: ${TABLE}.direction ;;
  }

  # Measures
  measure: total_amount {
    type: sum
    sql: ${TABLE}.amount ;;
    value_format_name: "decimal_2"
  }

  measure: inflow {
    type: sum
    sql: CASE WHEN ${TABLE}.direction = 'incoming' THEN ${TABLE}.amount ELSE 0 END ;;
    value_format_name: "decimal_2"
  }

  measure: outflow {
    type: sum
    sql: CASE WHEN ${TABLE}.direction = 'outgoing' THEN ${TABLE}.amount ELSE 0 END ;;
    value_format_name: "decimal_2"
  }

# New Measure Added Here
  measure: abs_total_amount {
    type: sum
    sql: ABS(${TABLE}.amount) ;;
    value_format_name: "decimal_2"
    description: "The sum of the absolute value of all amounts"
  }
}
