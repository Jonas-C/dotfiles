local Pkg = require("mason-core.package")
local npm = require("mason-core.managers.npm")

return Pkg.new({
	name = "typescript-plugin-css-modules",
	desc = [[TypeScript support for css modules]],
	homepage = "https://github.com/mrmckeb/typescript-plugin-css-modules",
	languages = { Pkg.Lang.TypeScript, Pkg.Lang.JavaScript },
	categories = { Pkg.Cat.LSP },
	install = npm.packages({ "typescript-plugin-css-modules" }),
})
