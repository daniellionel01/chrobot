//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Emulation Domain  
////
//// This domain emulates different environments for the page.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Emulation/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/dom
import protocol/page
import protocol/runtime

/// Screen orientation.
pub type ScreenOrientation {
  ScreenOrientation(type_: ScreenOrientationType, angle: Int)
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `ScreenOrientation`
pub type ScreenOrientationType {
  ScreenOrientationTypePortraitPrimary
  ScreenOrientationTypePortraitSecondary
  ScreenOrientationTypeLandscapePrimary
  ScreenOrientationTypeLandscapeSecondary
}

@internal
pub fn encode__screen_orientation_type(value__: ScreenOrientationType) {
  case value__ {
    ScreenOrientationTypePortraitPrimary -> "portraitPrimary"
    ScreenOrientationTypePortraitSecondary -> "portraitSecondary"
    ScreenOrientationTypeLandscapePrimary -> "landscapePrimary"
    ScreenOrientationTypeLandscapeSecondary -> "landscapeSecondary"
  }
  |> json.string()
}

@internal
pub fn decode__screen_orientation_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("portraitPrimary") -> Ok(ScreenOrientationTypePortraitPrimary)
    Ok("portraitSecondary") -> Ok(ScreenOrientationTypePortraitSecondary)
    Ok("landscapePrimary") -> Ok(ScreenOrientationTypeLandscapePrimary)
    Ok("landscapeSecondary") -> Ok(ScreenOrientationTypeLandscapeSecondary)
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

@internal
pub fn encode__screen_orientation(value__: ScreenOrientation) {
  json.object([
    #("type", encode__screen_orientation_type(value__.type_)),
    #("angle", json.int(value__.angle)),
  ])
}

@internal
pub fn decode__screen_orientation(value__: dynamic.Dynamic) {
  use type_ <- result.try(dynamic.field("type", decode__screen_orientation_type)(
    value__,
  ))
  use angle <- result.try(dynamic.field("angle", dynamic.int)(value__))

  Ok(ScreenOrientation(type_: type_, angle: angle))
}

pub type DisplayFeature {
  DisplayFeature(
    orientation: DisplayFeatureOrientation,
    offset: Int,
    mask_length: Int,
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `orientation` of `DisplayFeature`
pub type DisplayFeatureOrientation {
  DisplayFeatureOrientationVertical
  DisplayFeatureOrientationHorizontal
}

@internal
pub fn encode__display_feature_orientation(value__: DisplayFeatureOrientation) {
  case value__ {
    DisplayFeatureOrientationVertical -> "vertical"
    DisplayFeatureOrientationHorizontal -> "horizontal"
  }
  |> json.string()
}

@internal
pub fn decode__display_feature_orientation(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("vertical") -> Ok(DisplayFeatureOrientationVertical)
    Ok("horizontal") -> Ok(DisplayFeatureOrientationHorizontal)
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

@internal
pub fn encode__display_feature(value__: DisplayFeature) {
  json.object([
    #("orientation", encode__display_feature_orientation(value__.orientation)),
    #("offset", json.int(value__.offset)),
    #("maskLength", json.int(value__.mask_length)),
  ])
}

@internal
pub fn decode__display_feature(value__: dynamic.Dynamic) {
  use orientation <- result.try(dynamic.field(
    "orientation",
    decode__display_feature_orientation,
  )(value__))
  use offset <- result.try(dynamic.field("offset", dynamic.int)(value__))
  use mask_length <- result.try(dynamic.field("maskLength", dynamic.int)(
    value__,
  ))

  Ok(DisplayFeature(
    orientation: orientation,
    offset: offset,
    mask_length: mask_length,
  ))
}

pub type DevicePosture {
  DevicePosture(type_: DevicePostureType)
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `DevicePosture`
pub type DevicePostureType {
  DevicePostureTypeContinuous
  DevicePostureTypeFolded
}

@internal
pub fn encode__device_posture_type(value__: DevicePostureType) {
  case value__ {
    DevicePostureTypeContinuous -> "continuous"
    DevicePostureTypeFolded -> "folded"
  }
  |> json.string()
}

@internal
pub fn decode__device_posture_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("continuous") -> Ok(DevicePostureTypeContinuous)
    Ok("folded") -> Ok(DevicePostureTypeFolded)
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

@internal
pub fn encode__device_posture(value__: DevicePosture) {
  json.object([#("type", encode__device_posture_type(value__.type_))])
}

@internal
pub fn decode__device_posture(value__: dynamic.Dynamic) {
  use type_ <- result.try(dynamic.field("type", decode__device_posture_type)(
    value__,
  ))

  Ok(DevicePosture(type_: type_))
}

pub type MediaFeature {
  MediaFeature(name: String, value: String)
}

@internal
pub fn encode__media_feature(value__: MediaFeature) {
  json.object([
    #("name", json.string(value__.name)),
    #("value", json.string(value__.value)),
  ])
}

@internal
pub fn decode__media_feature(value__: dynamic.Dynamic) {
  use name <- result.try(dynamic.field("name", dynamic.string)(value__))
  use value <- result.try(dynamic.field("value", dynamic.string)(value__))

  Ok(MediaFeature(name: name, value: value))
}

pub fn clear_device_metrics_override() {
  todo
  // TODO generate command body
}

pub fn clear_geolocation_override() {
  todo
  // TODO generate command body
}

pub fn set_cpu_throttling_rate(rate: Float) {
  todo
  // TODO generate command body
}

pub fn set_default_background_color_override(color: option.Option(dom.RGBA)) {
  todo
  // TODO generate command body
}

pub fn set_device_metrics_override(
  width: Int,
  height: Int,
  device_scale_factor: Float,
  mobile: Bool,
  screen_orientation: option.Option(ScreenOrientation),
) {
  todo
  // TODO generate command body
}

pub fn set_emulated_media(
  media: option.Option(String),
  features: option.Option(List(MediaFeature)),
) {
  todo
  // TODO generate command body
}

pub fn set_emulated_vision_deficiency(type_: SetEmulatedVisionDeficiencyType) {
  todo
  // TODO generate command body
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `type` of `setEmulatedVisionDeficiency`
pub type SetEmulatedVisionDeficiencyType {
  SetEmulatedVisionDeficiencyTypeNone
  SetEmulatedVisionDeficiencyTypeBlurredVision
  SetEmulatedVisionDeficiencyTypeReducedContrast
  SetEmulatedVisionDeficiencyTypeAchromatopsia
  SetEmulatedVisionDeficiencyTypeDeuteranopia
  SetEmulatedVisionDeficiencyTypeProtanopia
  SetEmulatedVisionDeficiencyTypeTritanopia
}

@internal
pub fn encode__set_emulated_vision_deficiency_type(value__: SetEmulatedVisionDeficiencyType) {
  case value__ {
    SetEmulatedVisionDeficiencyTypeNone -> "none"
    SetEmulatedVisionDeficiencyTypeBlurredVision -> "blurredVision"
    SetEmulatedVisionDeficiencyTypeReducedContrast -> "reducedContrast"
    SetEmulatedVisionDeficiencyTypeAchromatopsia -> "achromatopsia"
    SetEmulatedVisionDeficiencyTypeDeuteranopia -> "deuteranopia"
    SetEmulatedVisionDeficiencyTypeProtanopia -> "protanopia"
    SetEmulatedVisionDeficiencyTypeTritanopia -> "tritanopia"
  }
  |> json.string()
}

@internal
pub fn decode__set_emulated_vision_deficiency_type(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("none") -> Ok(SetEmulatedVisionDeficiencyTypeNone)
    Ok("blurredVision") -> Ok(SetEmulatedVisionDeficiencyTypeBlurredVision)
    Ok("reducedContrast") -> Ok(SetEmulatedVisionDeficiencyTypeReducedContrast)
    Ok("achromatopsia") -> Ok(SetEmulatedVisionDeficiencyTypeAchromatopsia)
    Ok("deuteranopia") -> Ok(SetEmulatedVisionDeficiencyTypeDeuteranopia)
    Ok("protanopia") -> Ok(SetEmulatedVisionDeficiencyTypeProtanopia)
    Ok("tritanopia") -> Ok(SetEmulatedVisionDeficiencyTypeTritanopia)
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

pub fn set_geolocation_override(
  latitude: option.Option(Float),
  longitude: option.Option(Float),
  accuracy: option.Option(Float),
) {
  todo
  // TODO generate command body
}

pub fn set_idle_override(is_user_active: Bool, is_screen_unlocked: Bool) {
  todo
  // TODO generate command body
}

pub fn clear_idle_override() {
  todo
  // TODO generate command body
}

pub fn set_script_execution_disabled(value: Bool) {
  todo
  // TODO generate command body
}

pub fn set_touch_emulation_enabled(
  enabled: Bool,
  max_touch_points: option.Option(Int),
) {
  todo
  // TODO generate command body
}

pub fn set_timezone_override(timezone_id: String) {
  todo
  // TODO generate command body
}

pub fn set_user_agent_override(
  user_agent: String,
  accept_language: option.Option(String),
  platform: option.Option(String),
) {
  todo
  // TODO generate command body
}
