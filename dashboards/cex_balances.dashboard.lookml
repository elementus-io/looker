---
- dashboard: cex_balances
  title: CEX Balances
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: M8zUBYda5oGdLSnT4Nrh4l
  elements:
  - title: Entity Transfers Totals
    name: Entity Transfers Totals
    model: elementus
    explore: entity_transfers
    type: looker_grid
    fields: [entity_transfers.unique_symbol, entity_transfers.usd_total, entity_transfers.count,
      entity_transfers.total_unique_entities]
    filters:
      entity_transfers.date_date: 7 days
    sorts: [entity_transfers.usd_total desc 0]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Date Date: entity_transfers.date_date
    row: 0
    col: 0
    width: 14
    height: 8
  - title: BTC CEX Balances
    name: BTC CEX Balances
    model: elementus
    explore: daily_entity_balances
    type: looker_line
    fields: [daily_entity_balances.date_date, daily_entity_balances.total_balance]
    fill_fields: [daily_entity_balances.date_date]
    filters:
      daily_entity_balances.date_date: 7 days
      daily_entity_balances.entity_type: centralized exchange
      daily_entity_balances.symbol: BTC,WBTC,CBBTC,TBTC,HBTC,RENBTC
    sorts: [daily_entity_balances.date_date desc]
    limit: 500
    column_limit: 50
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
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: daily_entity_balances.total_balance,
            id: daily_entity_balances.total_balance, name: Total Balance}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Date Date: daily_entity_balances.date_date
    row: 0
    col: 14
    width: 8
    height: 8
  filters:
  - name: Date Date
    title: Date Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: elementus
    explore: entity_transfers
    listens_to_filters: []
    field: entity_transfers.date_date
