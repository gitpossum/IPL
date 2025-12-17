type TokenType =
    "NUMBER"
  | "STRING"
  | "IDENTIFIER"
  | "KEYWORD"
  | "SYMBOL"
  | "EOF"

local Keywords = {
  ["if"] = true,
  ["else"] = true,
  ["func"] = true,
  ["return"] = true,
}

local Lexer = {}
Lexer.__index = Lexer

function Lexer.new(input: string)
  return setmetatable({
    input = input,
    pos = 1,
    current = input:sub(1, 1)
  }, Lexer)
end

function Lexer:advance()
  self.pos = self.pos + 1
  if self.pos > #self.input then
    self.current = nil
  else
    self.current = self.input:sub(self.pos, self.pos)
  end
end

function Lexer:peek()
  if self.pos + 1 > #self.input then return nil end
  return self.input:sub(self.pos + 1, self.pos + 1)
end

function Lexer:isAlpha(c)
  return c:match("%a") ~= nil
end

function Lexer:isDigit(c)
  return c:match("%d") ~= nil
end

function Lexer:isAlnum(c)
  return self:isAlpha(c) or self:isDigit(c) or c == "_"
end

function Lexer:skipWhitespace()
  while self.current ~= nil and self.current:match("%s") do
    self:advance()
  end
end

function Lexer:identifier()
  local startPos = self.pos
  while self.current and self:isAlnum(self.current) do
    self:advance()
  end
  local text = self.input:sub(startPos, self.pos - 1)
  if Keywords[text] then
    return { type = "KEYWORD", value = text }
  else
    return { type = "IDENTIFIER", value = text }
  end
end

function Lexer:number()
  local startPos = self.pos
  while self.current and self:isDigit(self.current) do
    self:advance()
  end
  local text = self.input:sub(startPos, self.pos - 1)
  return { type = "NUMBER", value = tonumber(text) }
end

function Lexer:nextToken()
  self:skipWhitespace()

  if self.current == nil then
    return { type = "EOF" }
  end

  local c = self.current

  if self:isAlpha(c) then
    return self:identifier()
  elseif self:isDigit(c) then
    return self:number()
  end

  local symbols = {
    ["("] = true, [")"] = true, ["+"] = true, ["-"] = true,
    ["*"] = true, ["/"] = true, ["="] = true, ["{"] = true,
    ["}"] = true, ["λ"] = true,
  }

  if symbols[c] then
    self:advance()
    return { type = "SYMBOL", value = c }
  end

  error("Unexpected character: " .. c)
end

function Lexer:lex()
  local tokens = {}
  while true do
    local tok = self:nextToken()
    table.insert(tokens, tok)
    if tok.type == "EOF" then break end
  end
  return tokens
end

return Lexer