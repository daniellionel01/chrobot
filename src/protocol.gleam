//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// For reference: [See the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/)
//// 
//// This is the protocol definition entrypoint, it contains an overview of the protocol structure,
//// and a function to retrieve the version of the protocol used to generate the current bindings.  
//// The protocol version is also displayed in the box above, which appears on every generated module.  
//// 
//// ## Structure
//// 
//// Each domain in the protocol is represented as a module under `protocol/`. 
//// Domains may depend on the types of other domains, these dependencies are mirrored in the generated bindings where possible.
//// In some case, type references to other modules have been replaced by the respective inner type, because the references would
//// create a circular dependency. See the patch functions in `chrobot/internal/generate_bindings` for more information on this.
//// 
//// ## Types 
//// 
//// The generated bindings include a mirror of the type defitions of each type in the protocol spec,
//// alongside with an `encode__` function to encode the type into JSON in order to send it to the browser
//// and a `decode__` function in order to decode the type out of a payload sent from the browser.
//// 
//// Exceptions:  
//// - Some object properties in the protocol have the type `any`, in this case the value is considered as dynamic
//// by decoders, and encoders will not encode it, setting it to `null` instead in the payload
//// - Object types that don't specify any properties are treated as a `Dict(String,String)` 
//// 
//// Additional type definitions and encoders / decoders are generated, 
//// for any enumerable property in the protocol, as well as the return values of commands.  
//// These special type definitions are marked with a comment to indicate 
//// the fact that they are not part of the protocol spec, but rather generated dynamically to support the bindings.
//// 
//// 
//// ## Commands
//// 
//// A function is generated for each command, named after the command (in snake case), the function
//// handles both encoding the parameters to sent to the browser via the protocol, and decoding the response.
//// A `ProtocolError` error is returned if the decoding fails, this would mean there is a bug in the protocol
//// or the generated bindings.
//// 
//// The first parameter to the command function is always a `callback` of the form
//// 
//// ```gleam
//// fn(method: String, parameters: Option(Json)) -> Result(Dynamic, RequestError)
//// ```
//// 
//// By using this callback you can take advantage of the generated protocol encoders/decoders 
//// while also passing in your browser subject to direct the command to, and passing along additional
//// arguments, like the `sessionId` which is required for some operations.
//// 
//// 
//// ## Events
//// 
//// Events are not implemented yet!
//// 
//// 

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

const version_major = "1"

const version_minor = "3"

/// Get the protocol version as a tuple of major and minor version
pub fn version() {
  #(version_major, version_minor)
}
