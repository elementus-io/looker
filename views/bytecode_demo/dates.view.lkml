view: dates {
  sql_table_name: `elementus-prod-242016.utils.dates` ;;

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: day {
    type: number
    sql: ${TABLE}.day ;;
  }
  dimension: dayofweek {
    type: number
    sql: ${TABLE}.dayofweek ;;
  }
  dimension_group: last_sunday {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.last_sunday ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
  dimension: namedayofweek {
    type: string
    sql: ${TABLE}.namedayofweek ;;
  }
  dimension: namemonth {
    type: string
    sql: ${TABLE}.namemonth ;;
  }
  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }
  dimension: week_num {
    type: number
    sql: ${TABLE}.week_num ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }
}
