//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Fetch Domain  
////
//// A domain for letting clients substitute browser's network layer with client code.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Fetch/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrome
import gleam/dynamic
import gleam/json
import gleam/option
import gleam/result
import protocol/io
import protocol/network
import protocol/page

/// Unique request identifier.
pub type RequestId {
  RequestId(String)
}

@internal
pub fn encode__request_id(value__: RequestId) {
  case value__ {
    RequestId(inner_value__) -> json.string(inner_value__)
  }
}

@internal
pub fn decode__request_id(value__: dynamic.Dynamic) {
  value__
  |> dynamic.decode1(RequestId, dynamic.string)
  |> result.replace_error(chrome.ProtocolError)
}

/// Stages of the request to handle. Request will intercept before the request is
/// sent. Response will intercept after the response is received (but before response
/// body is received).
pub type RequestStage {
  RequestStageRequest
  RequestStageResponse
}

@internal
pub fn encode__request_stage(value__: RequestStage) {
  case value__ {
    RequestStageRequest -> "Request"
    RequestStageResponse -> "Response"
  }
  |> json.string()
}

@internal
pub fn decode__request_stage(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Request") -> Ok(RequestStageRequest)
    Ok("Response") -> Ok(RequestStageResponse)
    _ -> Error(chrome.ProtocolError)
  }
}

pub type RequestPattern {
  RequestPattern(
    url_pattern: option.Option(String),
    resource_type: option.Option(network.ResourceType),
    request_stage: option.Option(RequestStage),
  )
}

@internal
pub fn encode__request_pattern(value__: RequestPattern) {
  json.object([
    #("urlPattern", {
      case value__.url_pattern {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("resourceType", {
      case value__.resource_type {
        option.Some(value__) -> network.encode__resource_type(value__)
        option.None -> json.null()
      }
    }),
    #("requestStage", {
      case value__.request_stage {
        option.Some(value__) -> encode__request_stage(value__)
        option.None -> json.null()
      }
    }),
  ])
}

// TODO implement decoder for Object with props
/// Response HTTP header entry
pub type HeaderEntry {
  HeaderEntry(name: String, value: String)
}

@internal
pub fn encode__header_entry(value__: HeaderEntry) {
  json.object([
    #("name", json.string(value__.name)),
    #("value", json.string(value__.value)),
  ])
}

// TODO implement decoder for Object with props
/// Authorization challenge for HTTP status code 401 or 407.
pub type AuthChallenge {
  AuthChallenge(
    source: option.Option(AuthChallengeSource),
    origin: String,
    scheme: String,
    realm: String,
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `source` of `AuthChallenge`
pub type AuthChallengeSource {
  AuthChallengeSourceServer
  AuthChallengeSourceProxy
}

@internal
pub fn encode__auth_challenge_source(value__: AuthChallengeSource) {
  case value__ {
    AuthChallengeSourceServer -> "Server"
    AuthChallengeSourceProxy -> "Proxy"
  }
  |> json.string()
}

@internal
pub fn decode__auth_challenge_source(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Server") -> Ok(AuthChallengeSourceServer)
    Ok("Proxy") -> Ok(AuthChallengeSourceProxy)
    _ -> Error(chrome.ProtocolError)
  }
}

@internal
pub fn encode__auth_challenge(value__: AuthChallenge) {
  json.object([
    #("source", {
      case value__.source {
        option.Some(value__) -> encode__auth_challenge_source(value__)
        option.None -> json.null()
      }
    }),
    #("origin", json.string(value__.origin)),
    #("scheme", json.string(value__.scheme)),
    #("realm", json.string(value__.realm)),
  ])
}

// TODO implement decoder for Object with props
/// Response to an AuthChallenge.
pub type AuthChallengeResponse {
  AuthChallengeResponse(
    response: AuthChallengeResponseResponse,
    username: option.Option(String),
    password: option.Option(String),
  )
}

/// This type is not part of the protocol spec, it has been generated dynamically 
/// to represent the possible values of the enum property `response` of `AuthChallengeResponse`
pub type AuthChallengeResponseResponse {
  AuthChallengeResponseResponseDefault
  AuthChallengeResponseResponseCancelAuth
  AuthChallengeResponseResponseProvideCredentials
}

@internal
pub fn encode__auth_challenge_response_response(value__: AuthChallengeResponseResponse) {
  case value__ {
    AuthChallengeResponseResponseDefault -> "Default"
    AuthChallengeResponseResponseCancelAuth -> "CancelAuth"
    AuthChallengeResponseResponseProvideCredentials -> "ProvideCredentials"
  }
  |> json.string()
}

@internal
pub fn decode__auth_challenge_response_response(value__: dynamic.Dynamic) {
  case dynamic.string(value__) {
    Ok("Default") -> Ok(AuthChallengeResponseResponseDefault)
    Ok("CancelAuth") -> Ok(AuthChallengeResponseResponseCancelAuth)
    Ok("ProvideCredentials") ->
      Ok(AuthChallengeResponseResponseProvideCredentials)
    _ -> Error(chrome.ProtocolError)
  }
}

@internal
pub fn encode__auth_challenge_response(value__: AuthChallengeResponse) {
  json.object([
    #("response", encode__auth_challenge_response_response(value__.response)),
    #("username", {
      case value__.username {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
    #("password", {
      case value__.password {
        option.Some(value__) -> json.string(value__)
        option.None -> json.null()
      }
    }),
  ])
}
// TODO implement decoder for Object with props
