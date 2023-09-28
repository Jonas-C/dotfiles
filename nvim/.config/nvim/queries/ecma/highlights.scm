; inherits: ecma

; This is somehow needed for specific identifiers
(identifier) @variable

; For Component imports
((identifier) @constructor
 (#lua-match? @constructor "^[A-Z]"))


; Not entirely sure if this is needed.
(call_expression
  function: (identifier) @function.call)

; This is needed for stuff like `this.setState`, I think
(call_expression
  function: (member_expression
    property: [(property_identifier) (private_property_identifier)] @method.call))


; I would like declarations to stay a certain color
[
 "const"
 "let"
 "var"
 "extends"
 ] @keyword.declaration
