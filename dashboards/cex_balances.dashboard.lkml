dashboard: cex_balances {
  title: "Centralized Exchange Balances"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Aggregate balance history for centralized exchanges for BTC, ETH, LINK, USDT, FDUSD, and USDC."
  
  elements: [
    {
    name: btc_balance
    title: "BTC Balance"
    model: elementus
    explore: daily_entity_balances
    type: looker_line
    fields: [daily_entity_balances.date_date, daily_entity_balances.total_balance]
  filters: {
    "daily_entity_balances.entity_type": "centralized exchange"
    "daily_entity_balances.symbol": "BTC"
  }
  limit: 5000
  query_timezone: America/New_York
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_view_names: false
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  limit_displayed_rows: false
  legend_position: center
  point_style: none
  show_value_labels: false
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  show_null_points: true
  interpolation: linear
  row: 0
  col: 0
  width: 12
  height: 8
},
{
  name: eth_balance
  title: "ETH Balance"
  model: elementus
  explore: daily_entity_balances
  type: looker_line
  fields: [daily_entity_balances.date_date, daily_entity_balances.total_balance]
  filters: {
    "daily_entity_balances.entity_type": "centralized exchange"
    "daily_entity_balances.symbol": "ETH"
  }
  limit: 5000
  query_timezone: America/New_York
  x_axis_gridlines: false
  y_axis_gridlines: true
  show_view_names: false
  show_y_axis_labels: true
  show_y_axis_ticks: true
  y_axis_tick_density: default
  y_axis_tick_density_custom: 5
  show_x_axis_label: true
  show_x_axis_ticks: true
  y_axis_scale_mode: linear
  x_axis_reversed: false
  y_axis_reversed: false
  plot_size_by_field: false
  limit_displayed_rows: false
  legend_position: center
  point_style: none
  show_value_labels: false
  label_density: 25
  x_axis_scale: auto
  y_axis_combined: true
  show_null_points: true
  interpolation: linear
  row: 0
  col: 12
  width: 12
  height: 8
}
]
}