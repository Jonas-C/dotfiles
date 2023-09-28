; START COPY
; CREDIT TO: https://github.com/mskelton/dotfiles
;----------
; Variables
;-----------
(identifier) @variable

; Properties
;-----------

(property_identifier) @property
(shorthand_property_identifier) @property
(private_property_identifier) @property

(variable_declarator
  name: (object_pattern
    (shorthand_property_identifier_pattern))) @variable

; Special identifiers
;--------------------

((identifier) @constructor
 (#lua-match? @constructor "^[A-Z]"))

; ((identifier) @constant
;  (#lua-match? @constant "^[A-Z_][A-Z%d_]+$"))
;
; ((shorthand_property_identifier) @constant
;  (#lua-match? @constant "^[A-Z_][A-Z%d_]+$"))


; Function and method calls
;--------------------------

(call_expression
  function: (identifier) @function.call)

(call_expression
  function: (member_expression
    property: [(property_identifier) (private_property_identifier)] @method.call))

; Variables
;----------
(namespace_import
  (identifier) @namespace)

; Literals
;---------

[
  (this)
  (super)
] @variable.builtin

[
  (true)
  (false)
] @boolean

[
  (null)
  (undefined)
] @constant.builtin

(comment) @comment

(hash_bang_line) @preproc

(comment) @spell

(string) @string @spell

(escape_sequence) @string.escape
(regex_pattern) @string.regex
(regex "/" @punctuation.bracket) ; Regex delimiters

(number) @number
((identifier) @number
  (#any-of? @number "NaN" "Infinity"))

; Punctuation
;------------

"..." @punctuation.special

";" @punctuation.delimiter
"." @punctuation.delimiter
"," @punctuation.delimiter

(pair ":" @punctuation.delimiter)
(pair_pattern ":" @punctuation.delimiter)

[
  "--"
  "-"
  "-="
  "&&"
  "+"
  "++"
  "+="
  "&="
  "/="
  "**="
  "<<="
  "<"
  "<="
  "<<"
  "="
  "=="
  "==="
  "!="
  "!=="
  "=>"
  ">"
  ">="
  ">>"
  "||"
  "%"
  "%="
  "*"
  "**"
  ">>>"
  "&"
  "|"
  "^"
  "??"
  "*="
  ">>="
  ">>>="
  "^="
  "|="
  "&&="
  "||="
  "??="
] @operator

(binary_expression "/" @operator)
(ternary_expression ["?" ":"] @conditional.ternary)
(unary_expression ["!" "~" "-" "+"] @operator)
(unary_expression ["delete" "void" "typeof"] @keyword.operator)

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

((template_substitution ["${" "}"] @punctuation.special) @none)

; Keywords
;----------

[
"if"
"else"
"switch"
"case"
] @conditional

[
"import"
"from"
] @include

(export_specifier "as" @include)
(import_specifier "as" @include)
(namespace_export "as" @include)
(namespace_import "as" @include)

[
"for"
"of"
"do"
"while"
"continue"
] @repeat

[
"async"
"await"
"break"
"debugger"
"get"
"in"
"instanceof"
"set"
"static"
"target"
"typeof"
"with"
] @keyword

[
 "const"
 "let"
 "var"
 "extends"
 ] @keyword.declaration

[
"return"
"yield"
] @keyword.return

[
 "function"
] @keyword.function

[
 "new"
 "delete"
] @keyword.operator

[
 "throw"
 "try"
 "catch"
 "finally"
] @exception
;
[
 "export"
 ] @keyword.export

(export_statement
  "default" @keyword.export.default)
(switch_default
  "default" @conditional)
;----------
; END COPY
; CREDIT TO: https://github.com/mskelton/dotfiles

(template_string "`" @string)
((template_string) @string (#not-injected? @string styled css keyframes gql html))
