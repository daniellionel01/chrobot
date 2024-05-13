//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Performance Domain  
////
//// This protocol domain has no description.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Performance/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrobot/internal/utils
import chrome
import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result

/// Run-time execution metric.
pub type Metric {
  Metric(name: String, value: Float)
}

@internal
pub fn encode__metric(value__: Metric) {
  json.object([
    #("name", json.string(value__.name)),
    #("value", json.float(value__.value)),
  ])
}

@internal
pub fn decode__metric(value__: dynamic.Dynamic) {
  use name <- result.try(dynamic.field("name", dynamic.string)(value__))
  use value <- result.try(dynamic.field("value", dynamic.float)(value__))

  Ok(Metric(name: name, value: value))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `get_metrics`
pub type GetMetricsResponse {
  GetMetricsResponse(metrics: List(Metric))
}

@internal
pub fn decode__get_metrics_response(value__: dynamic.Dynamic) {
  use metrics <- result.try(dynamic.field(
    "metrics",
    dynamic.list(decode__metric),
  )(value__))

  Ok(GetMetricsResponse(metrics: metrics))
}

/// Disable collecting and reporting metrics.
pub fn disable(callback__) {
  let _ = callback__("Performance.disable", option.None)
  Nil
}

/// Enable collecting and reporting metrics.
pub fn enable(callback__, time_domain: option.Option(EnableTimeDomain)) {
  let _ =
    callback__(
      "Performance.enable",
      option.Some(json.object(
        []
        |> utils.add_optional(time_domain, fn(inner_value__) {
          #("timeDomain", encode__enable_time_domain(inner_value__))
        }),
      )),
    )
  Nil
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `timeDomain` of `enable`
pub type EnableTimeDomain {
  EnableTimeDomainTimeTicks
  EnableTimeDomainThreadTicks
}

@internal
pub fn encode__enable_time_domain(value__: EnableTimeDomain) {
  case value__ {
    EnableTimeDomainTimeTicks -> "timeTicks"
    EnableTimeDomainThreadTicks -> "threadTicks"
  }
  |> json.string()
}

@internal
pub fn decode__enable_time_domain(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("timeTicks") -> Ok(EnableTimeDomainTimeTicks)
    Ok("threadTicks") -> Ok(EnableTimeDomainThreadTicks)
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

/// Retrieve current values of run-time metrics.
pub fn get_metrics(callback__) {
  callback__("Performance.getMetrics", option.None)
  |> result.try(fn(result__) {
    decode__get_metrics_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}
