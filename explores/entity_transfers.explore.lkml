include: "/views/spotlight/entity_transfers.view.lkml"

explore: entity_transfers {
  description: "Blockchain Value Transfers with Entity Attributions"
  always_filter: {
    filters: [entity_transfers.date_raw: "last 7 days"]
  }
}
