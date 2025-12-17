local Parser = {}
Parser.__index = Parser

function Parser.new(tokens)
    return setmetatable({
        tokens = tokens,
        pos = 1,
        current = tokens[1]
    }, Parser)
end

function Parser:advance()
    self.pos = self.pos + 1
    self.current = self.tokens[self.pos] or { type="EOF" }
end

function Parser:expect(type: string, value: string?)
    if not self.current then
        error("Unexpected end of input")
    end
    if self.current.type ~= type or (value and self.current.value ~= value) then
        error(`Expected {type} {value or ""}, got {self.current.type} {self.current.value}`)
    end
    local tok = self.current
    self:advance()
    return tok
end

function Parser:currentValue()
    return self.current and self.current.value or nil
end

local parsePrimary, parseExpression, parseStatement

parsePrimary = function(self)
    local tok = self.current
    if not tok then error("Unexpected end of input") end

    if tok.type == "NUMBER" then
        self:advance()
        return { type="NumberLiteral", value=tok.value }

    elseif tok.type == "IDENTIFIER" then
        self:advance()
        if self:currentValue() == "(" then
            self:advance()
            local args = {}
            if self:currentValue() ~= ")" then
                while true do
                    table.insert(args, parseExpression(self))
                    if self:currentValue() == ")" then break end
                    self:expect("SYMBOL", ",")
                end
            end
            self:expect("SYMBOL", ")")
            return { type="CallExpression", callee={ type="Identifier", name=tok.value }, arguments=args }
        else
            return { type="Identifier", name=tok.value }
        end

    elseif self:currentValue() == "(" then
        self:advance()
        local expr = nil
        if self:currentValue() ~= ")" then
            expr = parseExpression(self)
        end
        self:expect("SYMBOL", ")")
        return expr
    end

    error("Unexpected token in primary: " .. tok.value)
end

parseExpression = function(self)
    local left = parsePrimary(self)
    while self.current and self.current.type == "SYMBOL" and self.current.value:match("[%+%-%*/><]") do
        local op = self.current.value
        self:advance()
        local right = parsePrimary(self)
        left = { type="BinaryExpression", operator=op, left=left, right=right }
    end
    return left
end

parseStatement = function(self)
    local tok = self.current
    if tok and tok.type == "KEYWORD" then
        if tok.value == "return" then
            self:advance()
            return { type="ReturnStatement", expression=parseExpression(self) }

        elseif tok.value == "if" then
            self:advance()
            local test = parseExpression(self)
            self:expect("SYMBOL", "{")
            local consequent = {}
            while self:currentValue() ~= "}" do
                table.insert(consequent, parseStatement(self))
            end
            self:expect("SYMBOL", "}")
            local alternate
            if self.current and self.current.type == "KEYWORD" and self.current.value == "else" then
                self:advance()
                self:expect("SYMBOL", "{")
                alternate = {}
                while self:currentValue() ~= "}" do
                    table.insert(alternate, parseStatement(self))
                end
                self:expect("SYMBOL", "}")
            end
            return { type="IfStatement", test=test, consequent=consequent, alternate=alternate }

        elseif tok.value == "func" then
            self:advance()
            local name = self:expect("IDENTIFIER").value
            self:expect("SYMBOL", "(")
            local params = {}
            if self:currentValue() ~= ")" then
                while true do
                    table.insert(params, self:expect("IDENTIFIER").value)
                    if self:currentValue() == ")" then break end
                    self:expect("SYMBOL", ",")
                end
            end
            self:expect("SYMBOL", ")")
            self:expect("SYMBOL", "{")
            local body = {}
            while self:currentValue() ~= "}" do
                table.insert(body, parseStatement(self))
            end
            self:expect("SYMBOL", "}")
            return { type="FunctionDeclaration", name=name, params=params, body=body }
        end
    end

    return parseExpression(self)
end

function Parser:parse()
    local stmts = {}
    while self.current and self.current.type ~= "EOF" do
        table.insert(stmts, parseStatement(self))
    end
    return { type="Program", body=stmts }
end

return Parser