; inherits: typescript,jsx
[
 "interface"
 "type"
 "declare"
 ] @keyword.declaration (#set! "priority" 2000)

; Override @tag @constructor usage in default tsx query
(jsx_opening_element ((nested_identifier (identifier) @constructor (identifier) @constructor)))
(jsx_closing_element ((nested_identifier (identifier) @constructor (identifier) @constructor)))
(jsx_self_closing_element ((nested_identifier (identifier) @constructor (identifier) @constructor)))
