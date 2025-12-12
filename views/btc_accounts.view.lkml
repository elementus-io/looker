view: btc_accounts {
  sql_table_name: `elementus-prod-242016.btcprod.btc_accounts` ;;

  dimension: account_subtype {
    type: string
    sql: ${TABLE}.account_subtype ;;
  }
  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }
  dimension: address {
    primary_key: yes
    type: string
    sql: ${TABLE}.address ;;
  }
  dimension: address_type {
    type: string
    sql: ${TABLE}.address_type ;;
  }
  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }
  dimension: beneficial_owner {
    type: string
    sql: ${TABLE}.beneficial_owner ;;
  }
  dimension: beneficial_owner_account_type {
    type: string
    sql: ${TABLE}.beneficial_owner_account_type ;;
  }
  dimension: cluster {
    type: string
    sql: ${TABLE}.cluster ;;
  }
  dimension: custodian {
    type: string
    sql: ${TABLE}.custodian ;;
  }
  dimension: entity {
    type: string
    sql: ${TABLE}.entity ;;
    link: {
      url: "https://blockexplorer.elementus.io/bitcoin/address/{{address._value}}"
      label: "Link to {{value}} Block Explorer"
    }
  }
  dimension: first_block {
    type: number
    sql: ${TABLE}.first_block ;;
  }
  dimension: is_entity_known {
    type: yesno
    sql: ${TABLE}.is_entity_known ;;
  }
  dimension: is_ofac_sanctioned {
    type: number
    sql: ${TABLE}.is_ofac_sanctioned ;;
  }
  dimension: manual_entity {
    type: string
    sql: ${TABLE}.manual_entity ;;
  }
  dimension: multisig {
    type: number
    sql: ${TABLE}.multisig ;;
  }
  dimension: sdn_name {
    type: string
    sql: ${TABLE}.sdn_name ;;
  }
  dimension: spotlight_entity {
    type: string
    sql: ${TABLE}.spotlight_entity ;;
  }
  dimension: spotlight_entity_type {
    type: string
    sql: ${TABLE}.spotlight_entity_type ;;
  }
  dimension: track_balances {
    type: yesno
    sql: ${TABLE}.track_balances ;;
  }
  dimension: wallet_id {
    type: string
    sql: ${TABLE}.wallet_id ;;
  }
  measure: count {
    type: count
    drill_fields: [sdn_name]
  }
}
