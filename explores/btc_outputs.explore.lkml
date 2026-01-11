include: "/views/public_data/inputs.view.lkml"
include: "/views/public_data/outputs.view.lkml"
include: "/views/cc_data/index_ohlcv_minutes.view.lkml"
include: "/views/bytecode_demo/derived_tables_demo/ndt_btc_outputs.view.lkml"

explore: btc_outputs {
  from: outputs
  join: inputs {
    type: left_outer
    sql_on: ${btc_outputs.transaction_hash} = ${inputs.transaction_hash} and ${btc_outputs.index} = ${inputs.spent_output_index} ;;
    relationship: one_to_one
  }

  join: index_ohlcv_minutes {
    type: left_outer
    sql_on: ${btc_outputs.block_timestamp_raw} = ${index_ohlcv_minutes.first_message_timestamp_raw} and ${index_ohlcv_minutes.instrument} = 'BTC-USD' ;;
    relationship: many_to_one
  }


}


explore: ndt_btc_outputs {}

