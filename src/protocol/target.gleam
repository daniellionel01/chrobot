//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Target Domain  
////
//// Supports additional targets discovery and allows to attach to them.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Target/)

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

pub type TargetID {
  TargetID(String)
}

@internal
pub fn encode__target_id(value__: TargetID) {
  case value__ {
    TargetID(inner_value__) -> json.string(inner_value__)
  }
}

@internal
pub fn decode__target_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(TargetID, dynamic.string)
}

/// Unique identifier of attached debugging session.
pub type SessionID {
  SessionID(String)
}

@internal
pub fn encode__session_id(value__: SessionID) {
  case value__ {
    SessionID(inner_value__) -> json.string(inner_value__)
  }
}

@internal
pub fn decode__session_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(SessionID, dynamic.string)
}

pub type TargetInfo {
  TargetInfo(
    target_id: TargetID,
    type_: String,
    title: String,
    url: String,
    attached: Bool,
    opener_id: option.Option(TargetID),
  )
}

@internal
pub fn encode__target_info(value__: TargetInfo) {
  json.object(
    [
      #("targetId", encode__target_id(value__.target_id)),
      #("type", json.string(value__.type_)),
      #("title", json.string(value__.title)),
      #("url", json.string(value__.url)),
      #("attached", json.bool(value__.attached)),
    ]
    |> utils.add_optional(value__.opener_id, fn(inner_value__) {
      #("openerId", encode__target_id(inner_value__))
    }),
  )
}

@internal
pub fn decode__target_info(value__: dynamic.Dynamic) {
  use target_id <- result.try(dynamic.field("targetId", decode__target_id)(
    value__,
  ))
  use type_ <- result.try(dynamic.field("type", dynamic.string)(value__))
  use title <- result.try(dynamic.field("title", dynamic.string)(value__))
  use url <- result.try(dynamic.field("url", dynamic.string)(value__))
  use attached <- result.try(dynamic.field("attached", dynamic.bool)(value__))
  use opener_id <- result.try(dynamic.optional_field(
    "openerId",
    decode__target_id,
  )(value__))

  Ok(TargetInfo(
    target_id: target_id,
    type_: type_,
    title: title,
    url: url,
    attached: attached,
    opener_id: opener_id,
  ))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `attach_to_target`
pub type AttachToTargetResponse {
  AttachToTargetResponse(session_id: SessionID)
}

@internal
pub fn decode__attach_to_target_response(value__: dynamic.Dynamic) {
  use session_id <- result.try(dynamic.field("sessionId", decode__session_id)(
    value__,
  ))

  Ok(AttachToTargetResponse(session_id: session_id))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `create_browser_context`
pub type CreateBrowserContextResponse {
  CreateBrowserContextResponse(browser_context_id: String)
}

@internal
pub fn decode__create_browser_context_response(value__: dynamic.Dynamic) {
  use browser_context_id <- result.try(dynamic.field(
    "browserContextId",
    dynamic.string,
  )(value__))

  Ok(CreateBrowserContextResponse(browser_context_id: browser_context_id))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `get_browser_contexts`
pub type GetBrowserContextsResponse {
  GetBrowserContextsResponse(browser_context_ids: List(String))
}

@internal
pub fn decode__get_browser_contexts_response(value__: dynamic.Dynamic) {
  use browser_context_ids <- result.try(dynamic.field(
    "browserContextIds",
    dynamic.list(dynamic.string),
  )(value__))

  Ok(GetBrowserContextsResponse(browser_context_ids: browser_context_ids))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `create_target`
pub type CreateTargetResponse {
  CreateTargetResponse(target_id: TargetID)
}

@internal
pub fn decode__create_target_response(value__: dynamic.Dynamic) {
  use target_id <- result.try(dynamic.field("targetId", decode__target_id)(
    value__,
  ))

  Ok(CreateTargetResponse(target_id: target_id))
}

/// This type is not part of the protocol spec, it has been generated dynamically
/// to represent the response to the command `get_targets`
pub type GetTargetsResponse {
  GetTargetsResponse(target_infos: List(TargetInfo))
}

@internal
pub fn decode__get_targets_response(value__: dynamic.Dynamic) {
  use target_infos <- result.try(dynamic.field(
    "targetInfos",
    dynamic.list(decode__target_info),
  )(value__))

  Ok(GetTargetsResponse(target_infos: target_infos))
}

/// Activates (focuses) the target.
pub fn activate_target(browser_subject__, session_id__, target_id: TargetID) {
  let _ =
    chrome.call(
      browser_subject__,
      "Target.activateTarget",
      option.Some(json.object([#("targetId", encode__target_id(target_id))])),
      session_id__,
      10_000,
    )
  Nil
}

/// Attaches to the target with given id.
pub fn attach_to_target(
  browser_subject__,
  session_id__,
  target_id: TargetID,
  flatten: option.Option(Bool),
) {
  chrome.call(
    browser_subject__,
    "Target.attachToTarget",
    option.Some(json.object(
      [#("targetId", encode__target_id(target_id))]
      |> utils.add_optional(flatten, fn(inner_value__) {
        #("flatten", json.bool(inner_value__))
      }),
    )),
    session_id__,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__attach_to_target_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Closes the target. If the target is a page that gets closed too.
pub fn close_target(browser_subject__, session_id__, target_id: TargetID) {
  let _ =
    chrome.call(
      browser_subject__,
      "Target.closeTarget",
      option.Some(json.object([#("targetId", encode__target_id(target_id))])),
      session_id__,
      10_000,
    )
  Nil
}

/// Creates a new empty BrowserContext. Similar to an incognito profile but you can have more than
/// one.
pub fn create_browser_context(browser_subject__, session_id__) {
  chrome.call(
    browser_subject__,
    "Target.createBrowserContext",
    option.None,
    session_id__,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__create_browser_context_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Returns all browser contexts created with `Target.createBrowserContext` method.
pub fn get_browser_contexts(browser_subject__, session_id__) {
  chrome.call(
    browser_subject__,
    "Target.getBrowserContexts",
    option.None,
    session_id__,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__get_browser_contexts_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Creates a new page.
pub fn create_target(
  browser_subject__,
  session_id__,
  url: String,
  width: option.Option(Int),
  height: option.Option(Int),
  new_window: option.Option(Bool),
  background: option.Option(Bool),
) {
  chrome.call(
    browser_subject__,
    "Target.createTarget",
    option.Some(json.object(
      [#("url", json.string(url))]
      |> utils.add_optional(width, fn(inner_value__) {
        #("width", json.int(inner_value__))
      })
      |> utils.add_optional(height, fn(inner_value__) {
        #("height", json.int(inner_value__))
      })
      |> utils.add_optional(new_window, fn(inner_value__) {
        #("newWindow", json.bool(inner_value__))
      })
      |> utils.add_optional(background, fn(inner_value__) {
        #("background", json.bool(inner_value__))
      }),
    )),
    session_id__,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__create_target_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Detaches session with given id.
pub fn detach_from_target(
  browser_subject__,
  session_id__,
  session_id: option.Option(SessionID),
) {
  let _ =
    chrome.call(
      browser_subject__,
      "Target.detachFromTarget",
      option.Some(json.object(
        []
        |> utils.add_optional(session_id, fn(inner_value__) {
          #("sessionId", encode__session_id(inner_value__))
        }),
      )),
      session_id__,
      10_000,
    )
  Nil
}

/// Deletes a BrowserContext. All the belonging pages will be closed without calling their
/// beforeunload hooks.
pub fn dispose_browser_context(
  browser_subject__,
  session_id__,
  browser_context_id: String,
) {
  let _ =
    chrome.call(
      browser_subject__,
      "Target.disposeBrowserContext",
      option.Some(
        json.object([#("browserContextId", json.string(browser_context_id))]),
      ),
      session_id__,
      10_000,
    )
  Nil
}

/// Retrieves a list of available targets.
pub fn get_targets(browser_subject__, session_id__) {
  chrome.call(
    browser_subject__,
    "Target.getTargets",
    option.None,
    session_id__,
    10_000,
  )
  |> result.try(fn(result__) {
    decode__get_targets_response(result__)
    |> result.replace_error(chrome.ProtocolError)
  })
}

/// Controls whether to automatically attach to new targets which are considered to be related to
/// this one. When turned on, attaches to all existing related targets as well. When turned off,
/// automatically detaches from all currently attached targets.
/// This also clears all targets added by `autoAttachRelated` from the list of targets to watch
/// for creation of related targets.
pub fn set_auto_attach(
  browser_subject__,
  session_id__,
  auto_attach: Bool,
  wait_for_debugger_on_start: Bool,
) {
  let _ =
    chrome.call(
      browser_subject__,
      "Target.setAutoAttach",
      option.Some(
        json.object([
          #("autoAttach", json.bool(auto_attach)),
          #("waitForDebuggerOnStart", json.bool(wait_for_debugger_on_start)),
        ]),
      ),
      session_id__,
      10_000,
    )
  Nil
}

/// Controls whether to discover available targets and notify via
/// `targetCreated/targetInfoChanged/targetDestroyed` events.
pub fn set_discover_targets(browser_subject__, session_id__, discover: Bool) {
  let _ =
    chrome.call(
      browser_subject__,
      "Target.setDiscoverTargets",
      option.Some(json.object([#("discover", json.bool(discover))])),
      session_id__,
      10_000,
    )
  Nil
}
