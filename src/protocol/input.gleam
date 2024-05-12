//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Input Domain  
////
//// This protocol domain has no description.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Input/)

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

pub type TouchPoint {
  TouchPoint(
    x: Float,
    y: Float,
    radius_x: option.Option(Float),
    radius_y: option.Option(Float),
    rotation_angle: option.Option(Float),
    force: option.Option(Float),
    tilt_x: option.Option(Float),
    tilt_y: option.Option(Float),
    id: option.Option(Float),
  )
}

@internal
pub fn encode__touch_point(value__: TouchPoint) {
  json.object(
    [#("x", json.float(value__.x)), #("y", json.float(value__.y))]
    |> utils.add_optional(value__.radius_x, fn(inner_value__) {
      #("radiusX", json.float(inner_value__))
    })
    |> utils.add_optional(value__.radius_y, fn(inner_value__) {
      #("radiusY", json.float(inner_value__))
    })
    |> utils.add_optional(value__.rotation_angle, fn(inner_value__) {
      #("rotationAngle", json.float(inner_value__))
    })
    |> utils.add_optional(value__.force, fn(inner_value__) {
      #("force", json.float(inner_value__))
    })
    |> utils.add_optional(value__.tilt_x, fn(inner_value__) {
      #("tiltX", json.float(inner_value__))
    })
    |> utils.add_optional(value__.tilt_y, fn(inner_value__) {
      #("tiltY", json.float(inner_value__))
    })
    |> utils.add_optional(value__.id, fn(inner_value__) {
      #("id", json.float(inner_value__))
    }),
  )
}

@internal
pub fn decode__touch_point(value__: dynamic.Dynamic) {
  use x <- result.try(dynamic.field("x", dynamic.float)(value__))
  use y <- result.try(dynamic.field("y", dynamic.float)(value__))
  use radius_x <- result.try(dynamic.optional_field("radiusX", dynamic.float)(
    value__,
  ))
  use radius_y <- result.try(dynamic.optional_field("radiusY", dynamic.float)(
    value__,
  ))
  use rotation_angle <- result.try(dynamic.optional_field(
    "rotationAngle",
    dynamic.float,
  )(value__))
  use force <- result.try(dynamic.optional_field("force", dynamic.float)(
    value__,
  ))
  use tilt_x <- result.try(dynamic.optional_field("tiltX", dynamic.float)(
    value__,
  ))
  use tilt_y <- result.try(dynamic.optional_field("tiltY", dynamic.float)(
    value__,
  ))
  use id <- result.try(dynamic.optional_field("id", dynamic.float)(value__))

  Ok(TouchPoint(
    x: x,
    y: y,
    radius_x: radius_x,
    radius_y: radius_y,
    rotation_angle: rotation_angle,
    force: force,
    tilt_x: tilt_x,
    tilt_y: tilt_y,
    id: id,
  ))
}

pub type MouseButton {
  MouseButtonNone
  MouseButtonLeft
  MouseButtonMiddle
  MouseButtonRight
  MouseButtonBack
  MouseButtonForward
}

@internal
pub fn encode__mouse_button(value__: MouseButton) {
  case value__ {
    MouseButtonNone -> "none"
    MouseButtonLeft -> "left"
    MouseButtonMiddle -> "middle"
    MouseButtonRight -> "right"
    MouseButtonBack -> "back"
    MouseButtonForward -> "forward"
  }
  |> json.string()
}

@internal
pub fn decode__mouse_button(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("none") -> Ok(MouseButtonNone)
    Ok("left") -> Ok(MouseButtonLeft)
    Ok("middle") -> Ok(MouseButtonMiddle)
    Ok("right") -> Ok(MouseButtonRight)
    Ok("back") -> Ok(MouseButtonBack)
    Ok("forward") -> Ok(MouseButtonForward)
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

/// UTC time in seconds, counted from January 1, 1970.
pub type TimeSinceEpoch {
  TimeSinceEpoch(Float)
}

@internal
pub fn encode__time_since_epoch(value__: TimeSinceEpoch) {
  case value__ {
    TimeSinceEpoch(inner_value__) -> json.float(inner_value__)
  }
}

@internal
pub fn decode__time_since_epoch(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(TimeSinceEpoch, dynamic.float)
}

/// Dispatches a key event to the page.
pub fn dispatch_key_event(
  browser_subject__,
  session_id__,
  type_: DispatchKeyEventType,
  modifiers: option.Option(Int),
  timestamp: option.Option(TimeSinceEpoch),
  text: option.Option(String),
  unmodified_text: option.Option(String),
  key_identifier: option.Option(String),
  code: option.Option(String),
  key: option.Option(String),
  windows_virtual_key_code: option.Option(Int),
  native_virtual_key_code: option.Option(Int),
  auto_repeat: option.Option(Bool),
  is_keypad: option.Option(Bool),
  is_system_key: option.Option(Bool),
  location: option.Option(Int),
) {
  let _ =
    chrome.call(
      browser_subject__,
      "Input.dispatchKeyEvent",
      option.Some(json.object(
        [#("type", encode__dispatch_key_event_type(type_))]
        |> utils.add_optional(modifiers, fn(inner_value__) {
          #("modifiers", json.int(inner_value__))
        })
        |> utils.add_optional(timestamp, fn(inner_value__) {
          #("timestamp", encode__time_since_epoch(inner_value__))
        })
        |> utils.add_optional(text, fn(inner_value__) {
          #("text", json.string(inner_value__))
        })
        |> utils.add_optional(unmodified_text, fn(inner_value__) {
          #("unmodifiedText", json.string(inner_value__))
        })
        |> utils.add_optional(key_identifier, fn(inner_value__) {
          #("keyIdentifier", json.string(inner_value__))
        })
        |> utils.add_optional(code, fn(inner_value__) {
          #("code", json.string(inner_value__))
        })
        |> utils.add_optional(key, fn(inner_value__) {
          #("key", json.string(inner_value__))
        })
        |> utils.add_optional(windows_virtual_key_code, fn(inner_value__) {
          #("windowsVirtualKeyCode", json.int(inner_value__))
        })
        |> utils.add_optional(native_virtual_key_code, fn(inner_value__) {
          #("nativeVirtualKeyCode", json.int(inner_value__))
        })
        |> utils.add_optional(auto_repeat, fn(inner_value__) {
          #("autoRepeat", json.bool(inner_value__))
        })
        |> utils.add_optional(is_keypad, fn(inner_value__) {
          #("isKeypad", json.bool(inner_value__))
        })
        |> utils.add_optional(is_system_key, fn(inner_value__) {
          #("isSystemKey", json.bool(inner_value__))
        })
        |> utils.add_optional(location, fn(inner_value__) {
          #("location", json.int(inner_value__))
        }),
      )),
      session_id__,
      10_000,
    )
  Nil
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `dispatchKeyEvent`
pub type DispatchKeyEventType {
  DispatchKeyEventTypeKeyDown
  DispatchKeyEventTypeKeyUp
  DispatchKeyEventTypeRawKeyDown
  DispatchKeyEventTypeChar
}

@internal
pub fn encode__dispatch_key_event_type(value__: DispatchKeyEventType) {
  case value__ {
    DispatchKeyEventTypeKeyDown -> "keyDown"
    DispatchKeyEventTypeKeyUp -> "keyUp"
    DispatchKeyEventTypeRawKeyDown -> "rawKeyDown"
    DispatchKeyEventTypeChar -> "char"
  }
  |> json.string()
}

@internal
pub fn decode__dispatch_key_event_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("keyDown") -> Ok(DispatchKeyEventTypeKeyDown)
    Ok("keyUp") -> Ok(DispatchKeyEventTypeKeyUp)
    Ok("rawKeyDown") -> Ok(DispatchKeyEventTypeRawKeyDown)
    Ok("char") -> Ok(DispatchKeyEventTypeChar)
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

/// Dispatches a mouse event to the page.
pub fn dispatch_mouse_event(
  browser_subject__,
  session_id__,
  type_: DispatchMouseEventType,
  x: Float,
  y: Float,
  modifiers: option.Option(Int),
  timestamp: option.Option(TimeSinceEpoch),
  button: option.Option(MouseButton),
  buttons: option.Option(Int),
  click_count: option.Option(Int),
  tilt_x: option.Option(Float),
  tilt_y: option.Option(Float),
  delta_x: option.Option(Float),
  delta_y: option.Option(Float),
  pointer_type: option.Option(DispatchMouseEventPointerType),
) {
  let _ =
    chrome.call(
      browser_subject__,
      "Input.dispatchMouseEvent",
      option.Some(json.object(
        [
          #("type", encode__dispatch_mouse_event_type(type_)),
          #("x", json.float(x)),
          #("y", json.float(y)),
        ]
        |> utils.add_optional(modifiers, fn(inner_value__) {
          #("modifiers", json.int(inner_value__))
        })
        |> utils.add_optional(timestamp, fn(inner_value__) {
          #("timestamp", encode__time_since_epoch(inner_value__))
        })
        |> utils.add_optional(button, fn(inner_value__) {
          #("button", encode__mouse_button(inner_value__))
        })
        |> utils.add_optional(buttons, fn(inner_value__) {
          #("buttons", json.int(inner_value__))
        })
        |> utils.add_optional(click_count, fn(inner_value__) {
          #("clickCount", json.int(inner_value__))
        })
        |> utils.add_optional(tilt_x, fn(inner_value__) {
          #("tiltX", json.float(inner_value__))
        })
        |> utils.add_optional(tilt_y, fn(inner_value__) {
          #("tiltY", json.float(inner_value__))
        })
        |> utils.add_optional(delta_x, fn(inner_value__) {
          #("deltaX", json.float(inner_value__))
        })
        |> utils.add_optional(delta_y, fn(inner_value__) {
          #("deltaY", json.float(inner_value__))
        })
        |> utils.add_optional(pointer_type, fn(inner_value__) {
          #(
            "pointerType",
            encode__dispatch_mouse_event_pointer_type(inner_value__),
          )
        }),
      )),
      session_id__,
      10_000,
    )
  Nil
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `dispatchMouseEvent`
pub type DispatchMouseEventType {
  DispatchMouseEventTypeMousePressed
  DispatchMouseEventTypeMouseReleased
  DispatchMouseEventTypeMouseMoved
  DispatchMouseEventTypeMouseWheel
}

@internal
pub fn encode__dispatch_mouse_event_type(value__: DispatchMouseEventType) {
  case value__ {
    DispatchMouseEventTypeMousePressed -> "mousePressed"
    DispatchMouseEventTypeMouseReleased -> "mouseReleased"
    DispatchMouseEventTypeMouseMoved -> "mouseMoved"
    DispatchMouseEventTypeMouseWheel -> "mouseWheel"
  }
  |> json.string()
}

@internal
pub fn decode__dispatch_mouse_event_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("mousePressed") -> Ok(DispatchMouseEventTypeMousePressed)
    Ok("mouseReleased") -> Ok(DispatchMouseEventTypeMouseReleased)
    Ok("mouseMoved") -> Ok(DispatchMouseEventTypeMouseMoved)
    Ok("mouseWheel") -> Ok(DispatchMouseEventTypeMouseWheel)
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

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `pointerType` of `dispatchMouseEvent`
pub type DispatchMouseEventPointerType {
  DispatchMouseEventPointerTypeMouse
  DispatchMouseEventPointerTypePen
}

@internal
pub fn encode__dispatch_mouse_event_pointer_type(value__: DispatchMouseEventPointerType) {
  case value__ {
    DispatchMouseEventPointerTypeMouse -> "mouse"
    DispatchMouseEventPointerTypePen -> "pen"
  }
  |> json.string()
}

@internal
pub fn decode__dispatch_mouse_event_pointer_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("mouse") -> Ok(DispatchMouseEventPointerTypeMouse)
    Ok("pen") -> Ok(DispatchMouseEventPointerTypePen)
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

/// Dispatches a touch event to the page.
pub fn dispatch_touch_event(
  browser_subject__,
  session_id__,
  type_: DispatchTouchEventType,
  touch_points: List(TouchPoint),
  modifiers: option.Option(Int),
  timestamp: option.Option(TimeSinceEpoch),
) {
  let _ =
    chrome.call(
      browser_subject__,
      "Input.dispatchTouchEvent",
      option.Some(json.object(
        [
          #("type", encode__dispatch_touch_event_type(type_)),
          #("touchPoints", json.array(touch_points, of: encode__touch_point)),
        ]
        |> utils.add_optional(modifiers, fn(inner_value__) {
          #("modifiers", json.int(inner_value__))
        })
        |> utils.add_optional(timestamp, fn(inner_value__) {
          #("timestamp", encode__time_since_epoch(inner_value__))
        }),
      )),
      session_id__,
      10_000,
    )
  Nil
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `dispatchTouchEvent`
pub type DispatchTouchEventType {
  DispatchTouchEventTypeTouchStart
  DispatchTouchEventTypeTouchEnd
  DispatchTouchEventTypeTouchMove
  DispatchTouchEventTypeTouchCancel
}

@internal
pub fn encode__dispatch_touch_event_type(value__: DispatchTouchEventType) {
  case value__ {
    DispatchTouchEventTypeTouchStart -> "touchStart"
    DispatchTouchEventTypeTouchEnd -> "touchEnd"
    DispatchTouchEventTypeTouchMove -> "touchMove"
    DispatchTouchEventTypeTouchCancel -> "touchCancel"
  }
  |> json.string()
}

@internal
pub fn decode__dispatch_touch_event_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("touchStart") -> Ok(DispatchTouchEventTypeTouchStart)
    Ok("touchEnd") -> Ok(DispatchTouchEventTypeTouchEnd)
    Ok("touchMove") -> Ok(DispatchTouchEventTypeTouchMove)
    Ok("touchCancel") -> Ok(DispatchTouchEventTypeTouchCancel)
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

/// Cancels any active dragging in the page.
pub fn cancel_dragging(browser_subject__, session_id__) {
  let _ =
    chrome.call(
      browser_subject__,
      "Input.cancelDragging",
      option.None,
      session_id__,
      10_000,
    )
  Nil
}

/// Ignores input events (useful while auditing page).
pub fn set_ignore_input_events(browser_subject__, session_id__, ignore: Bool) {
  let _ =
    chrome.call(
      browser_subject__,
      "Input.setIgnoreInputEvents",
      option.Some(json.object([#("ignore", json.bool(ignore))])),
      session_id__,
      10_000,
    )
  Nil
}
