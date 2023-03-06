local Pkg = require("mason-core.package")
local npm = require("mason-core.managers.npm")

return Pkg.new({
name = "typescript-styled-plugin",
desc = [[Styled components Intellisense]],
homepage = "https://github.com/Microsoft/typescript-styled-plugin",
languages = {Pkg.Lang.TypeScript, Pkg.Lang.JavaScript},
categories = {Pkg.Cat.LSP},
install = npm.packages({"typescript-styled-plugin"})
})
