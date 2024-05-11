//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Page Domain  
////
//// Actions and events related to the inspected page belong to the page domain.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Page/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/debugger
import protocol/dom
import protocol/io
import protocol/network
import protocol/runtime

/// Unique frame identifier.
pub type FrameId {
  FrameId(String)
}

@internal
pub fn encode__frame_id(value__: FrameId) {
  case value__ {
    FrameId(inner_value__) -> json.string(inner_value__)
  }
}

@internal
pub fn decode__frame_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(FrameId, dynamic.string)
}

/// Information about the Frame on the page.
pub type Frame {
  Frame(
    id: FrameId,
    parent_id: option.Option(FrameId),
    loader_id: network.LoaderId,
    name: option.Option(String),
    url: String,
    security_origin: String,
    mime_type: String,
  )
}

@internal
pub fn encode__frame(value__: Frame) {
  json.object([
    #("id", encode__frame_id(value__.id)),
    #("parentId", {
      case value__.parent_id {
        option.Some(value__) -> encode__frame_id(value__)
        option.None -> json.null()
      }
    }),
    #("loaderId", network.encode__loader_id(value__.loader_id)),
    #("name", {
      case value__.name {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("url", json.string(value__.url)),
    #("securityOrigin", json.string(value__.security_origin)),
    #("mimeType", json.string(value__.mime_type)),
  ])
}

@internal
pub fn decode__frame(value__: dynamic.Dynamic) {
  use id <- result.try(dynamic.field("id", decode__frame_id)(value__))
  use parent_id <- result.try(dynamic.optional_field(
    "parentId",
    decode__frame_id,
  )(value__))
  use loader_id <- result.try(dynamic.field(
    "loaderId",
    network.decode__loader_id,
  )(value__))
  use name <- result.try(dynamic.optional_field("name", dynamic.string)(value__))
  use url <- result.try(dynamic.field("url", dynamic.string)(value__))
  use security_origin <- result.try(dynamic.field(
    "securityOrigin",
    dynamic.string,
  )(value__))
  use mime_type <- result.try(dynamic.field("mimeType", dynamic.string)(value__))

  Ok(Frame(
    id: id,
    parent_id: parent_id,
    loader_id: loader_id,
    name: name,
    url: url,
    security_origin: security_origin,
    mime_type: mime_type,
  ))
}

/// Information about the Frame hierarchy.
pub type FrameTree {
  FrameTree(frame: Frame, child_frames: option.Option(List(FrameTree)))
}

@internal
pub fn encode__frame_tree(value__: FrameTree) {
  json.object([
    #("frame", encode__frame(value__.frame)),
    #("childFrames", {
      case value__.child_frames {
        option.Some(value__) -> json.array(value__, of: encode__frame_tree)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__frame_tree(value__: dynamic.Dynamic) {
  use frame <- result.try(dynamic.field("frame", decode__frame)(value__))
  use child_frames <- result.try(dynamic.optional_field(
    "childFrames",
    dynamic.list(decode__frame_tree),
  )(value__))

  Ok(FrameTree(frame: frame, child_frames: child_frames))
}

/// Unique script identifier.
pub type ScriptIdentifier {
  ScriptIdentifier(String)
}

@internal
pub fn encode__script_identifier(value__: ScriptIdentifier) {
  case value__ {
    ScriptIdentifier(inner_value__) -> json.string(inner_value__)
  }
}

@internal
pub fn decode__script_identifier(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(ScriptIdentifier, dynamic.string)
}

/// Transition type.
pub type TransitionType {
  TransitionTypeLink
  TransitionTypeTyped
  TransitionTypeAddressBar
  TransitionTypeAutoBookmark
  TransitionTypeAutoSubframe
  TransitionTypeManualSubframe
  TransitionTypeGenerated
  TransitionTypeAutoToplevel
  TransitionTypeFormSubmit
  TransitionTypeReload
  TransitionTypeKeyword
  TransitionTypeKeywordGenerated
  TransitionTypeOther
}

@internal
pub fn encode__transition_type(value__: TransitionType) {
  case value__ {
    TransitionTypeLink -> "link"
    TransitionTypeTyped -> "typed"
    TransitionTypeAddressBar -> "address_bar"
    TransitionTypeAutoBookmark -> "auto_bookmark"
    TransitionTypeAutoSubframe -> "auto_subframe"
    TransitionTypeManualSubframe -> "manual_subframe"
    TransitionTypeGenerated -> "generated"
    TransitionTypeAutoToplevel -> "auto_toplevel"
    TransitionTypeFormSubmit -> "form_submit"
    TransitionTypeReload -> "reload"
    TransitionTypeKeyword -> "keyword"
    TransitionTypeKeywordGenerated -> "keyword_generated"
    TransitionTypeOther -> "other"
  }
  |> json.string()
}

@internal
pub fn decode__transition_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("link") -> Ok(TransitionTypeLink)
    Ok("typed") -> Ok(TransitionTypeTyped)
    Ok("address_bar") -> Ok(TransitionTypeAddressBar)
    Ok("auto_bookmark") -> Ok(TransitionTypeAutoBookmark)
    Ok("auto_subframe") -> Ok(TransitionTypeAutoSubframe)
    Ok("manual_subframe") -> Ok(TransitionTypeManualSubframe)
    Ok("generated") -> Ok(TransitionTypeGenerated)
    Ok("auto_toplevel") -> Ok(TransitionTypeAutoToplevel)
    Ok("form_submit") -> Ok(TransitionTypeFormSubmit)
    Ok("reload") -> Ok(TransitionTypeReload)
    Ok("keyword") -> Ok(TransitionTypeKeyword)
    Ok("keyword_generated") -> Ok(TransitionTypeKeywordGenerated)
    Ok("other") -> Ok(TransitionTypeOther)
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

/// Navigation history entry.
pub type NavigationEntry {
  NavigationEntry(
    id: Int,
    url: String,
    user_typed_url: String,
    title: String,
    transition_type: TransitionType,
  )
}

@internal
pub fn encode__navigation_entry(value__: NavigationEntry) {
  json.object([
    #("id", json.int(value__.id)),
    #("url", json.string(value__.url)),
    #("userTypedURL", json.string(value__.user_typed_url)),
    #("title", json.string(value__.title)),
    #("transitionType", encode__transition_type(value__.transition_type)),
  ])
}

@internal
pub fn decode__navigation_entry(value__: dynamic.Dynamic) {
  use id <- result.try(dynamic.field("id", dynamic.int)(value__))
  use url <- result.try(dynamic.field("url", dynamic.string)(value__))
  use user_typed_url <- result.try(dynamic.field("userTypedURL", dynamic.string)(
    value__,
  ))
  use title <- result.try(dynamic.field("title", dynamic.string)(value__))
  use transition_type <- result.try(dynamic.field(
    "transitionType",
    decode__transition_type,
  )(value__))

  Ok(NavigationEntry(
    id: id,
    url: url,
    user_typed_url: user_typed_url,
    title: title,
    transition_type: transition_type,
  ))
}

/// Javascript dialog type.
pub type DialogType {
  DialogTypeAlert
  DialogTypeConfirm
  DialogTypePrompt
  DialogTypeBeforeunload
}

@internal
pub fn encode__dialog_type(value__: DialogType) {
  case value__ {
    DialogTypeAlert -> "alert"
    DialogTypeConfirm -> "confirm"
    DialogTypePrompt -> "prompt"
    DialogTypeBeforeunload -> "beforeunload"
  }
  |> json.string()
}

@internal
pub fn decode__dialog_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("alert") -> Ok(DialogTypeAlert)
    Ok("confirm") -> Ok(DialogTypeConfirm)
    Ok("prompt") -> Ok(DialogTypePrompt)
    Ok("beforeunload") -> Ok(DialogTypeBeforeunload)
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

/// Error while paring app manifest.
pub type AppManifestError {
  AppManifestError(message: String, critical: Int, line: Int, column: Int)
}

@internal
pub fn encode__app_manifest_error(value__: AppManifestError) {
  json.object([
    #("message", json.string(value__.message)),
    #("critical", json.int(value__.critical)),
    #("line", json.int(value__.line)),
    #("column", json.int(value__.column)),
  ])
}

@internal
pub fn decode__app_manifest_error(value__: dynamic.Dynamic) {
  use message <- result.try(dynamic.field("message", dynamic.string)(value__))
  use critical <- result.try(dynamic.field("critical", dynamic.int)(value__))
  use line <- result.try(dynamic.field("line", dynamic.int)(value__))
  use column <- result.try(dynamic.field("column", dynamic.int)(value__))

  Ok(AppManifestError(
    message: message,
    critical: critical,
    line: line,
    column: column,
  ))
}

/// Layout viewport position and dimensions.
pub type LayoutViewport {
  LayoutViewport(
    page_x: Int,
    page_y: Int,
    client_width: Int,
    client_height: Int,
  )
}

@internal
pub fn encode__layout_viewport(value__: LayoutViewport) {
  json.object([
    #("pageX", json.int(value__.page_x)),
    #("pageY", json.int(value__.page_y)),
    #("clientWidth", json.int(value__.client_width)),
    #("clientHeight", json.int(value__.client_height)),
  ])
}

@internal
pub fn decode__layout_viewport(value__: dynamic.Dynamic) {
  use page_x <- result.try(dynamic.field("pageX", dynamic.int)(value__))
  use page_y <- result.try(dynamic.field("pageY", dynamic.int)(value__))
  use client_width <- result.try(dynamic.field("clientWidth", dynamic.int)(
    value__,
  ))
  use client_height <- result.try(dynamic.field("clientHeight", dynamic.int)(
    value__,
  ))

  Ok(LayoutViewport(
    page_x: page_x,
    page_y: page_y,
    client_width: client_width,
    client_height: client_height,
  ))
}

/// Visual viewport position, dimensions, and scale.
pub type VisualViewport {
  VisualViewport(
    offset_x: Float,
    offset_y: Float,
    page_x: Float,
    page_y: Float,
    client_width: Float,
    client_height: Float,
    scale: Float,
    zoom: option.Option(Float),
  )
}

@internal
pub fn encode__visual_viewport(value__: VisualViewport) {
  json.object([
    #("offsetX", json.float(value__.offset_x)),
    #("offsetY", json.float(value__.offset_y)),
    #("pageX", json.float(value__.page_x)),
    #("pageY", json.float(value__.page_y)),
    #("clientWidth", json.float(value__.client_width)),
    #("clientHeight", json.float(value__.client_height)),
    #("scale", json.float(value__.scale)),
    #("zoom", {
      case value__.zoom {
        option.Some(value__) -> json.float(value__)
        option.None -> json.null()
      }
    }),
  ])
}

@internal
pub fn decode__visual_viewport(value__: dynamic.Dynamic) {
  use offset_x <- result.try(dynamic.field("offsetX", dynamic.float)(value__))
  use offset_y <- result.try(dynamic.field("offsetY", dynamic.float)(value__))
  use page_x <- result.try(dynamic.field("pageX", dynamic.float)(value__))
  use page_y <- result.try(dynamic.field("pageY", dynamic.float)(value__))
  use client_width <- result.try(dynamic.field("clientWidth", dynamic.float)(
    value__,
  ))
  use client_height <- result.try(dynamic.field("clientHeight", dynamic.float)(
    value__,
  ))
  use scale <- result.try(dynamic.field("scale", dynamic.float)(value__))
  use zoom <- result.try(dynamic.optional_field("zoom", dynamic.float)(value__))

  Ok(VisualViewport(
    offset_x: offset_x,
    offset_y: offset_y,
    page_x: page_x,
    page_y: page_y,
    client_width: client_width,
    client_height: client_height,
    scale: scale,
    zoom: zoom,
  ))
}

/// Viewport for capturing screenshot.
pub type Viewport {
  Viewport(x: Float, y: Float, width: Float, height: Float, scale: Float)
}

@internal
pub fn encode__viewport(value__: Viewport) {
  json.object([
    #("x", json.float(value__.x)),
    #("y", json.float(value__.y)),
    #("width", json.float(value__.width)),
    #("height", json.float(value__.height)),
    #("scale", json.float(value__.scale)),
  ])
}

@internal
pub fn decode__viewport(value__: dynamic.Dynamic) {
  use x <- result.try(dynamic.field("x", dynamic.float)(value__))
  use y <- result.try(dynamic.field("y", dynamic.float)(value__))
  use width <- result.try(dynamic.field("width", dynamic.float)(value__))
  use height <- result.try(dynamic.field("height", dynamic.float)(value__))
  use scale <- result.try(dynamic.field("scale", dynamic.float)(value__))

  Ok(Viewport(x: x, y: y, width: width, height: height, scale: scale))
}
