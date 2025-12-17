local LexerObj = require("./lexer")
local ParserObj = require("./parser")

local text = [[func square(x) {
    return x * x
}
]]

local lex = LexerObj.new(text)
local tokens = lex:lex()
local par = ParserObj.new(tokens)
local ast = par:parse()

print(ast)