//// > This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## Debugger Domain  
////
//// Debugger domain exposes JavaScript debugging capabilities. It allows setting and removing
//// breakpoints, stepping through execution, exploring stack traces, etc.  
////
//// [View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/Debugger/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import chrome
import protocol/runtime

/// Breakpoint identifier.
pub type BreakpointId {
  BreakpointId(String)
}

/// Call frame identifier.
pub type CallFrameId {
  CallFrameId(String)
}

/// Location in the source code.
pub type Location

// TODO -- codegen for this type definition is not implemented 

/// JavaScript call frame. Array of call frames form the call stack.
pub type CallFrame

// TODO -- codegen for this type definition is not implemented 

/// Scope description.
pub type Scope

// TODO -- codegen for this type definition is not implemented 

/// Search match for resource.
pub type SearchMatch

// TODO -- codegen for this type definition is not implemented 

pub type BreakLocation

// TODO -- codegen for this type definition is not implemented 

/// Enum of possible script languages.
pub type ScriptLanguage {
  ScriptLanguageJavaScript
  ScriptLanguageWebAssembly
}

/// Debug symbols available for a wasm script.
pub type DebugSymbols
// TODO -- codegen for this type definition is not implemented 
