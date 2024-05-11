//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Tracing Domain  
////
//// This protocol domain has no description.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Tracing/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/io

pub type TraceConfig {
  TraceConfig(
    included_categories: option.Option(List(String)),
    excluded_categories: option.Option(List(String)),
  )
}

@internal
pub fn encode__trace_config(value__: TraceConfig) {
  json.object([
    #("includedCategories", {
      case value__.included_categories {
        option.Some(value__) -> json.array(value__, of: json.string)
        option.None -> json.null()
      }
    }),
    #("excludedCategories", {
      case value__.excluded_categories {
        option.Some(value__) -> json.array(value__, of: json.string)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__trace_config(value__: dynamic.Dynamic) {
  use included_categories <- result.try(dynamic.optional_field(
    "includedCategories",
    dynamic.list(dynamic.string),
  )(value__))
  use excluded_categories <- result.try(dynamic.optional_field(
    "excludedCategories",
    dynamic.list(dynamic.string),
  )(value__))

  Ok(TraceConfig(
    included_categories: included_categories,
    excluded_categories: excluded_categories,
  ))
}

pub fn end() {
  todo
  // TODO generate command body
}

pub fn start(
  transfer_mode: option.Option(StartTransferMode),
  stream_format: option.Option(StreamFormat),
  trace_config: option.Option(TraceConfig),
) {
  todo
  // TODO generate command body
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `transferMode` of `start`
pub type StartTransferMode {
  StartTransferModeReportEvents
  StartTransferModeReturnAsStream
}

@internal
pub fn encode__start_transfer_mode(value__: StartTransferMode) {
  case value__ {
    StartTransferModeReportEvents -> "ReportEvents"
    StartTransferModeReturnAsStream -> "ReturnAsStream"
  }
  |> json.string()
}

@internal
pub fn decode__start_transfer_mode(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("ReportEvents") -> Ok(StartTransferModeReportEvents)
    Ok("ReturnAsStream") -> Ok(StartTransferModeReturnAsStream)
    Error(error) -> Error(error)
    Ok(other) ->
      Error([
        dynamic.DecodeError(
          expected: "valid enum property",
          found: other,
          path: ["enum decoder"],
        ),
      ])
  }
}
