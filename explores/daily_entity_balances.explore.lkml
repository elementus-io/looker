explore: daily_entity_balances {
  label: "Daily Entity Balances"
  view_label: "Daily Entity Balances"
  
  always_filter: {
    filters: [daily_entity_balances.date_date: "7 days"]
  }
}
