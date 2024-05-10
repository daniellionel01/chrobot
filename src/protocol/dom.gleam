//// > ⚙️  This module was generated from the Chrome DevTools Protocol version **1.3**
//// ## DOM Domain  
////
//// This domain exposes DOM read/write operations. Each DOM Node is represented with its mirror object
//// that has an `id`. This `id` can be used to get additional information on the Node, resolve it into
//// the JavaScript object wrapper, etc. It is important that client receives DOM events only for the
//// nodes that are known to the client. Backend keeps track of the nodes that were sent to the client
//// and never sends the same node twice. It is client's responsibility to collect information about
//// the nodes that were sent to the client. Note that `iframe` owner elements will return
//// corresponding document elements as their child nodes.  
////
//// [📖   View this domain on the DevTools Protocol API Docs](https://chromedevtools.github.io/devtools-protocol/1-3/DOM/)

// ---------------------------------------------------------------------------
// |  !!!!!!   This is an autogenerated file - Do not edit manually  !!!!!!  |
// | Run ` gleam run -m scripts/generate_protocol_bindings.sh` to regenerate.|  
// ---------------------------------------------------------------------------

import gleam/dynamic
import gleam/json
import gleam/option
import protocol/runtime

/// Unique DOM node identifier.
pub type NodeId {
  NodeId(Int)
}

@internal
pub fn encode__node_id(value: NodeId) {
  case value {
    NodeId(inner_value) -> json.int(inner_value)
  }
}

/// Unique DOM node identifier used to reference a node that may not have been pushed to the
/// front-end.
pub type BackendNodeId {
  BackendNodeId(Int)
}

@internal
pub fn encode__backend_node_id(value: BackendNodeId) {
  case value {
    BackendNodeId(inner_value) -> json.int(inner_value)
  }
}

/// Backend node with a friendly name.
pub type BackendNode {
  BackendNode(node_type: Int, node_name: String, backend_node_id: BackendNodeId)
}

// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("nodeType", Some("`Node`'s nodeType."), None, None, None, PrimitiveType("integer")), PropertyDefinition("nodeName", Some("`Node`'s nodeName."), None, None, None, PrimitiveType("string")), PropertyDefinition("backendNodeId", None, None, None, None, RefType("BackendNodeId"))]))
/// Pseudo element type.
pub type PseudoType {
  PseudoTypeFirstLine
  PseudoTypeFirstLetter
  PseudoTypeBefore
  PseudoTypeAfter
  PseudoTypeMarker
  PseudoTypeBackdrop
  PseudoTypeSelection
  PseudoTypeTargetText
  PseudoTypeSpellingError
  PseudoTypeGrammarError
  PseudoTypeHighlight
  PseudoTypeFirstLineInherited
  PseudoTypeScrollMarker
  PseudoTypeScrollMarkers
  PseudoTypeScrollbar
  PseudoTypeScrollbarThumb
  PseudoTypeScrollbarButton
  PseudoTypeScrollbarTrack
  PseudoTypeScrollbarTrackPiece
  PseudoTypeScrollbarCorner
  PseudoTypeResizer
  PseudoTypeInputListButton
  PseudoTypeViewTransition
  PseudoTypeViewTransitionGroup
  PseudoTypeViewTransitionImagePair
  PseudoTypeViewTransitionOld
  PseudoTypeViewTransitionNew
}

// TODO: implement type encoder for EnumType(["first-line", "first-letter", "before", "after", "marker", "backdrop", "selection", "target-text", "spelling-error", "grammar-error", "highlight", "first-line-inherited", "scroll-marker", "scroll-markers", "scrollbar", "scrollbar-thumb", "scrollbar-button", "scrollbar-track", "scrollbar-track-piece", "scrollbar-corner", "resizer", "input-list-button", "view-transition", "view-transition-group", "view-transition-image-pair", "view-transition-old", "view-transition-new"])
/// Shadow root type.
pub type ShadowRootType {
  ShadowRootTypeUserAgent
  ShadowRootTypeOpen
  ShadowRootTypeClosed
}

// TODO: implement type encoder for EnumType(["user-agent", "open", "closed"])
/// Document compatibility mode.
pub type CompatibilityMode {
  CompatibilityModeQuirksMode
  CompatibilityModeLimitedQuirksMode
  CompatibilityModeNoQuirksMode
}

// TODO: implement type encoder for EnumType(["QuirksMode", "LimitedQuirksMode", "NoQuirksMode"])
/// ContainerSelector physical axes
pub type PhysicalAxes {
  PhysicalAxesHorizontal
  PhysicalAxesVertical
  PhysicalAxesBoth
}

// TODO: implement type encoder for EnumType(["Horizontal", "Vertical", "Both"])
/// ContainerSelector logical axes
pub type LogicalAxes {
  LogicalAxesInline
  LogicalAxesBlock
  LogicalAxesBoth
}

// TODO: implement type encoder for EnumType(["Inline", "Block", "Both"])
/// Physical scroll orientation
pub type ScrollOrientation {
  ScrollOrientationHorizontal
  ScrollOrientationVertical
}

// TODO: implement type encoder for EnumType(["horizontal", "vertical"])
/// DOM interaction is implemented in terms of mirror objects that represent the actual DOM nodes.
/// DOMNode is a base node mirror type.
pub type Node {
  Node(
    node_id: NodeId,
    parent_id: option.Option(NodeId),
    backend_node_id: BackendNodeId,
    node_type: Int,
    node_name: String,
    local_name: String,
    node_value: String,
    child_node_count: option.Option(Int),
    children: option.Option(List(Node)),
    attributes: option.Option(List(String)),
    document_url: option.Option(String),
    base_url: option.Option(String),
    public_id: option.Option(String),
    system_id: option.Option(String),
    internal_subset: option.Option(String),
    xml_version: option.Option(String),
    name: option.Option(String),
    value: option.Option(String),
    pseudo_type: option.Option(PseudoType),
    pseudo_identifier: option.Option(String),
    shadow_root_type: option.Option(ShadowRootType),
    frame_id: option.Option(String),
    content_document: option.Option(Node),
    shadow_roots: option.Option(List(Node)),
    template_content: option.Option(Node),
    pseudo_elements: option.Option(List(Node)),
    distributed_nodes: option.Option(List(BackendNode)),
    is_svg: option.Option(Bool),
    compatibility_mode: option.Option(CompatibilityMode),
    assigned_slot: option.Option(BackendNode),
  )
}

// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("nodeId", Some("Node identifier that is passed into the rest of the DOM messages as the `nodeId`. Backend\nwill only push node with given `id` once. It is aware of all requested nodes and will only\nfire DOM events for nodes known to the client."), None, None, None, RefType("NodeId")), PropertyDefinition("parentId", Some("The id of the parent node if any."), None, None, Some(True), RefType("NodeId")), PropertyDefinition("backendNodeId", Some("The BackendNodeId for this node."), None, None, None, RefType("BackendNodeId")), PropertyDefinition("nodeType", Some("`Node`'s nodeType."), None, None, None, PrimitiveType("integer")), PropertyDefinition("nodeName", Some("`Node`'s nodeName."), None, None, None, PrimitiveType("string")), PropertyDefinition("localName", Some("`Node`'s localName."), None, None, None, PrimitiveType("string")), PropertyDefinition("nodeValue", Some("`Node`'s nodeValue."), None, None, None, PrimitiveType("string")), PropertyDefinition("childNodeCount", Some("Child count for `Container` nodes."), None, None, Some(True), PrimitiveType("integer")), PropertyDefinition("children", Some("Child nodes of this node when requested with children."), None, None, Some(True), ArrayType(ReferenceItem("Node"))), PropertyDefinition("attributes", Some("Attributes of the `Element` node in the form of flat array `[name1, value1, name2, value2]`."), None, None, Some(True), ArrayType(PrimitiveItem("string"))), PropertyDefinition("documentURL", Some("Document URL that `Document` or `FrameOwner` node points to."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("baseURL", Some("Base URL that `Document` or `FrameOwner` node uses for URL completion."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("publicId", Some("`DocumentType`'s publicId."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("systemId", Some("`DocumentType`'s systemId."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("internalSubset", Some("`DocumentType`'s internalSubset."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("xmlVersion", Some("`Document`'s XML version in case of XML documents."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("name", Some("`Attr`'s name."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("value", Some("`Attr`'s value."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("pseudoType", Some("Pseudo element type for this node."), None, None, Some(True), RefType("PseudoType")), PropertyDefinition("pseudoIdentifier", Some("Pseudo element identifier for this node. Only present if there is a\nvalid pseudoType."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("shadowRootType", Some("Shadow root type."), None, None, Some(True), RefType("ShadowRootType")), PropertyDefinition("frameId", Some("Frame ID for frame owner elements."), None, None, Some(True), PrimitiveType("string")), PropertyDefinition("contentDocument", Some("Content document for frame owner elements."), None, None, Some(True), RefType("Node")), PropertyDefinition("shadowRoots", Some("Shadow root list for given element host."), None, None, Some(True), ArrayType(ReferenceItem("Node"))), PropertyDefinition("templateContent", Some("Content document fragment for template elements."), None, None, Some(True), RefType("Node")), PropertyDefinition("pseudoElements", Some("Pseudo elements associated with this node."), None, None, Some(True), ArrayType(ReferenceItem("Node"))), PropertyDefinition("distributedNodes", Some("Distributed nodes for given insertion point."), None, None, Some(True), ArrayType(ReferenceItem("BackendNode"))), PropertyDefinition("isSVG", Some("Whether the node is SVG."), None, None, Some(True), PrimitiveType("boolean")), PropertyDefinition("compatibilityMode", None, None, None, Some(True), RefType("CompatibilityMode")), PropertyDefinition("assignedSlot", None, None, None, Some(True), RefType("BackendNode"))]))
/// A structure holding an RGBA color.
pub type RGBA {
  RGBA(r: Int, g: Int, b: Int, a: option.Option(Float))
}

// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("r", Some("The red component, in the [0-255] range."), None, None, None, PrimitiveType("integer")), PropertyDefinition("g", Some("The green component, in the [0-255] range."), None, None, None, PrimitiveType("integer")), PropertyDefinition("b", Some("The blue component, in the [0-255] range."), None, None, None, PrimitiveType("integer")), PropertyDefinition("a", Some("The alpha component, in the [0-1] range (default: 1)."), None, None, Some(True), PrimitiveType("number"))]))
/// An array of quad vertices, x immediately followed by y for each point, points clock-wise.
pub type Quad {
  Quad(List(Float))
}

// TODO: implement type encoder for ArrayType(PrimitiveItem("number"))
/// Box model.
pub type BoxModel {
  BoxModel(
    content: Quad,
    padding: Quad,
    border: Quad,
    margin: Quad,
    width: Int,
    height: Int,
    shape_outside: option.Option(ShapeOutsideInfo),
  )
}

// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("content", Some("Content box"), None, None, None, RefType("Quad")), PropertyDefinition("padding", Some("Padding box"), None, None, None, RefType("Quad")), PropertyDefinition("border", Some("Border box"), None, None, None, RefType("Quad")), PropertyDefinition("margin", Some("Margin box"), None, None, None, RefType("Quad")), PropertyDefinition("width", Some("Node width"), None, None, None, PrimitiveType("integer")), PropertyDefinition("height", Some("Node height"), None, None, None, PrimitiveType("integer")), PropertyDefinition("shapeOutside", Some("Shape outside coordinates"), None, None, Some(True), RefType("ShapeOutsideInfo"))]))
/// CSS Shape Outside details.
pub type ShapeOutsideInfo {
  ShapeOutsideInfo(
    bounds: Quad,
    shape: List(dynamic.Dynamic),
    margin_shape: List(dynamic.Dynamic),
  )
}

// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("bounds", Some("Shape bounds"), None, None, None, RefType("Quad")), PropertyDefinition("shape", Some("Shape coordinate details"), None, None, None, ArrayType(PrimitiveItem("any"))), PropertyDefinition("marginShape", Some("Margin shape bounds"), None, None, None, ArrayType(PrimitiveItem("any")))]))
/// Rectangle.
pub type Rect {
  Rect(x: Float, y: Float, width: Float, height: Float)
}

// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("x", Some("X coordinate"), None, None, None, PrimitiveType("number")), PropertyDefinition("y", Some("Y coordinate"), None, None, None, PrimitiveType("number")), PropertyDefinition("width", Some("Rectangle width"), None, None, None, PrimitiveType("number")), PropertyDefinition("height", Some("Rectangle height"), None, None, None, PrimitiveType("number"))]))
pub type CSSComputedStyleProperty {
  CSSComputedStyleProperty(name: String, value: String)
}
// TODO: implement type encoder for ObjectType(Some([PropertyDefinition("name", Some("Computed style property name."), None, None, None, PrimitiveType("string")), PropertyDefinition("value", Some("Computed style property value."), None, None, None, PrimitiveType("string"))]))
