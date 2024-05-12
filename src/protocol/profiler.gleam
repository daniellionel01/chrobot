//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Profiler Domain  
////
//// This protocol domain has no description.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Profiler/)

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
import protocol/runtime

/// Profile node. Holds callsite information, execution statistics and child nodes.
pub type ProfileNode {
  ProfileNode(
    id: Int,
    call_frame: runtime.CallFrame,
    hit_count: option.Option(Int),
    children: option.Option(List(Int)),
    deopt_reason: option.Option(String),
    position_ticks: option.Option(List(PositionTickInfo)),
  )
}

@internal
pub fn encode__profile_node(value__: ProfileNode) {
  json.object(
    [
      #("id", json.int(value__.id)),
      #("callFrame", runtime.encode__call_frame(value__.call_frame)),
    ]
    |> utils.add_optional(value__.hit_count, fn(inner_value__) {
      #("hitCount", json.int(inner_value__))
    })
    |> utils.add_optional(value__.children, fn(inner_value__) {
      #("children", json.array(inner_value__, of: json.int))
    })
    |> utils.add_optional(value__.deopt_reason, fn(inner_value__) {
      #("deoptReason", json.string(inner_value__))
    })
    |> utils.add_optional(value__.position_ticks, fn(inner_value__) {
      #(
        "positionTicks",
        json.array(inner_value__, of: encode__position_tick_info),
      )
    }),
  )
}

@internal
pub fn decode__profile_node(value__: dynamic.Dynamic) {
  use id <- result.try(dynamic.field("id", dynamic.int)(value__))
  use call_frame <- result.try(dynamic.field(
    "callFrame",
    runtime.decode__call_frame,
  )(value__))
  use hit_count <- result.try(dynamic.optional_field("hitCount", dynamic.int)(
    value__,
  ))
  use children <- result.try(dynamic.optional_field(
    "children",
    dynamic.list(dynamic.int),
  )(value__))
  use deopt_reason <- result.try(dynamic.optional_field(
    "deoptReason",
    dynamic.string,
  )(value__))
  use position_ticks <- result.try(dynamic.optional_field(
    "positionTicks",
    dynamic.list(decode__position_tick_info),
  )(value__))

  Ok(ProfileNode(
    id: id,
    call_frame: call_frame,
    hit_count: hit_count,
    children: children,
    deopt_reason: deopt_reason,
    position_ticks: position_ticks,
  ))
}

/// Profile.
pub type Profile {
  Profile(
    nodes: List(ProfileNode),
    start_time: Float,
    end_time: Float,
    samples: option.Option(List(Int)),
    time_deltas: option.Option(List(Int)),
  )
}

@internal
pub fn encode__profile(value__: Profile) {
  json.object(
    [
      #("nodes", json.array(value__.nodes, of: encode__profile_node)),
      #("startTime", json.float(value__.start_time)),
      #("endTime", json.float(value__.end_time)),
    ]
    |> utils.add_optional(value__.samples, fn(inner_value__) {
      #("samples", json.array(inner_value__, of: json.int))
    })
    |> utils.add_optional(value__.time_deltas, fn(inner_value__) {
      #("timeDeltas", json.array(inner_value__, of: json.int))
    }),
  )
}

@internal
pub fn decode__profile(value__: dynamic.Dynamic) {
  use nodes <- result.try(dynamic.field(
    "nodes",
    dynamic.list(decode__profile_node),
  )(value__))
  use start_time <- result.try(dynamic.field("startTime", dynamic.float)(
    value__,
  ))
  use end_time <- result.try(dynamic.field("endTime", dynamic.float)(value__))
  use samples <- result.try(dynamic.optional_field(
    "samples",
    dynamic.list(dynamic.int),
  )(value__))
  use time_deltas <- result.try(dynamic.optional_field(
    "timeDeltas",
    dynamic.list(dynamic.int),
  )(value__))

  Ok(Profile(
    nodes: nodes,
    start_time: start_time,
    end_time: end_time,
    samples: samples,
    time_deltas: time_deltas,
  ))
}

/// Specifies a number of samples attributed to a certain source position.
pub type PositionTickInfo {
  PositionTickInfo(line: Int, ticks: Int)
}

@internal
pub fn encode__position_tick_info(value__: PositionTickInfo) {
  json.object([
    #("line", json.int(value__.line)),
    #("ticks", json.int(value__.ticks)),
  ])
}

@internal
pub fn decode__position_tick_info(value__: dynamic.Dynamic) {
  use line <- result.try(dynamic.field("line", dynamic.int)(value__))
  use ticks <- result.try(dynamic.field("ticks", dynamic.int)(value__))

  Ok(PositionTickInfo(line: line, ticks: ticks))
}

/// Coverage data for a source range.
pub type CoverageRange {
  CoverageRange(start_offset: Int, end_offset: Int, count: Int)
}

@internal
pub fn encode__coverage_range(value__: CoverageRange) {
  json.object([
    #("startOffset", json.int(value__.start_offset)),
    #("endOffset", json.int(value__.end_offset)),
    #("count", json.int(value__.count)),
  ])
}

@internal
pub fn decode__coverage_range(value__: dynamic.Dynamic) {
  use start_offset <- result.try(dynamic.field("startOffset", dynamic.int)(
    value__,
  ))
  use end_offset <- result.try(dynamic.field("endOffset", dynamic.int)(value__))
  use count <- result.try(dynamic.field("count", dynamic.int)(value__))

  Ok(CoverageRange(
    start_offset: start_offset,
    end_offset: end_offset,
    count: count,
  ))
}

/// Coverage data for a JavaScript function.
pub type FunctionCoverage {
  FunctionCoverage(
    function_name: String,
    ranges: List(CoverageRange),
    is_block_coverage: Bool,
  )
}

@internal
pub fn encode__function_coverage(value__: FunctionCoverage) {
  json.object([
    #("functionName", json.string(value__.function_name)),
    #("ranges", json.array(value__.ranges, of: encode__coverage_range)),
    #("isBlockCoverage", json.bool(value__.is_block_coverage)),
  ])
}

@internal
pub fn decode__function_coverage(value__: dynamic.Dynamic) {
  use function_name <- result.try(dynamic.field("functionName", dynamic.string)(
    value__,
  ))
  use ranges <- result.try(dynamic.field(
    "ranges",
    dynamic.list(decode__coverage_range),
  )(value__))
  use is_block_coverage <- result.try(dynamic.field(
    "isBlockCoverage",
    dynamic.bool,
  )(value__))

  Ok(FunctionCoverage(
    function_name: function_name,
    ranges: ranges,
    is_block_coverage: is_block_coverage,
  ))
}

/// Coverage data for a JavaScript script.
pub type ScriptCoverage {
  ScriptCoverage(
    script_id: runtime.ScriptId,
    url: String,
    functions: List(FunctionCoverage),
  )
}

@internal
pub fn encode__script_coverage(value__: ScriptCoverage) {
  json.object([
    #("scriptId", runtime.encode__script_id(value__.script_id)),
    #("url", json.string(value__.url)),
    #("functions", json.array(value__.functions, of: encode__function_coverage)),
  ])
}

@internal
pub fn decode__script_coverage(value__: dynamic.Dynamic) {
  use script_id <- result.try(dynamic.field(
    "scriptId",
    runtime.decode__script_id,
  )(value__))
  use url <- result.try(dynamic.field("url", dynamic.string)(value__))
  use functions <- result.try(dynamic.field(
    "functions",
    dynamic.list(decode__function_coverage),
  )(value__))

  Ok(ScriptCoverage(script_id: script_id, url: url, functions: functions))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `get_best_effort_coverage`
pub type GetBestEffortCoverageResponse {
  GetBestEffortCoverageResponse(result: List(ScriptCoverage))
}

@internal
pub fn decode__get_best_effort_coverage_response(value__: dynamic.Dynamic) {
  use result <- result.try(dynamic.field(
    "result",
    dynamic.list(decode__script_coverage),
  )(value__))

  Ok(GetBestEffortCoverageResponse(result: result))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `start_precise_coverage`
pub type StartPreciseCoverageResponse {
  StartPreciseCoverageResponse(timestamp: Float)
}

@internal
pub fn decode__start_precise_coverage_response(value__: dynamic.Dynamic) {
  use timestamp <- result.try(dynamic.field("timestamp", dynamic.float)(value__))

  Ok(StartPreciseCoverageResponse(timestamp: timestamp))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `stop`
pub type StopResponse {
  StopResponse(profile: Profile)
}

@internal
pub fn decode__stop_response(value__: dynamic.Dynamic) {
  use profile <- result.try(dynamic.field("profile", decode__profile)(value__))

  Ok(StopResponse(profile: profile))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `take_precise_coverage`
pub type TakePreciseCoverageResponse {
  TakePreciseCoverageResponse(result: List(ScriptCoverage), timestamp: Float)
}

@internal
pub fn decode__take_precise_coverage_response(value__: dynamic.Dynamic) {
  use result <- result.try(dynamic.field(
    "result",
    dynamic.list(decode__script_coverage),
  )(value__))
  use timestamp <- result.try(dynamic.field("timestamp", dynamic.float)(value__))

  Ok(TakePreciseCoverageResponse(result: result, timestamp: timestamp))
}

/// This generated protocol command has no description
pub fn disable(browser_subject) {
  let _ = chrome.call(browser_subject, "Profiler.disable", option.None, 10_000)
  Nil
}

/// This generated protocol command has no description
pub fn enable(browser_subject) {
  let _ = chrome.call(browser_subject, "Profiler.enable", option.None, 10_000)
  Nil
}

/// Collect coverage data for the current isolate. The coverage data may be incomplete due to
/// garbage collection.
pub fn get_best_effort_coverage(browser_subject) {
  chrome.call(
    browser_subject,
    "Profiler.getBestEffortCoverage",
    option.None,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__get_best_effort_coverage_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Changes CPU profiler sampling interval. Must be called before CPU profiles recording started.
pub fn set_sampling_interval(browser_subject, interval: Int) {
  let _ =
    chrome.call(
      browser_subject,
      "Profiler.setSamplingInterval",
      option.Some(json.object([#("interval", json.int(interval))])),
      10_000,
    )
  Nil
}

/// This generated protocol command has no description
pub fn start(browser_subject) {
  let _ = chrome.call(browser_subject, "Profiler.start", option.None, 10_000)
  Nil
}

/// Enable precise code coverage. Coverage data for JavaScript executed before enabling precise code
/// coverage may be incomplete. Enabling prevents running optimized code and resets execution
/// counters.
pub fn start_precise_coverage(
  browser_subject,
  call_count: option.Option(Bool),
  detailed: option.Option(Bool),
  allow_triggered_updates: option.Option(Bool),
) {
  chrome.call(
    browser_subject,
    "Profiler.startPreciseCoverage",
    option.Some(json.object(
      []
      |> utils.add_optional(call_count, fn(inner_value__) {
        #("callCount", json.bool(inner_value__))
      })
      |> utils.add_optional(detailed, fn(inner_value__) {
        #("detailed", json.bool(inner_value__))
      })
      |> utils.add_optional(allow_triggered_updates, fn(inner_value__) {
        #("allowTriggeredUpdates", json.bool(inner_value__))
      }),
    )),
    10_000,
  )
  |> result.try(fn(result__) {
    decode__start_precise_coverage_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// This generated protocol command has no description
pub fn stop(browser_subject) {
  chrome.call(browser_subject, "Profiler.stop", option.None, 10_000)
  |> result.try(fn(result__) {
    decode__stop_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Disable precise code coverage. Disabling releases unnecessary execution count records and allows
/// executing optimized code.
pub fn stop_precise_coverage(browser_subject) {
  let _ =
    chrome.call(
      browser_subject,
      "Profiler.stopPreciseCoverage",
      option.None,
      10_000,
    )
  Nil
}

/// Collect coverage data for the current isolate, and resets execution counters. Precise code
/// coverage needs to have started.
pub fn take_precise_coverage(browser_subject) {
  chrome.call(
    browser_subject,
    "Profiler.takePreciseCoverage",
    option.None,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__take_precise_coverage_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}
