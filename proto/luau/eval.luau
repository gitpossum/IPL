local fs = require("@lune/fs")
local process = require("@lune/process")
local LexerObj = require("./lexer")
local ParserObj = require("./parser")

local filename = process.args[1]
if not filename then
    error("Usage: lune run eval.luau <file.ipl>")
end

local code = fs.readFile(filename)

local lex = LexerObj.new(code)
local tokens = lex:lex()
local par = ParserObj.new(tokens)
local ast = par:parse()

local function eval(ast, env): any?
    env = env or {}
    local evalNode

    evalNode = function(node, localEnv)
        if node.type == "Program" then
            local result
            for _, stmt in ipairs(node.body) do
                result = evalNode(stmt, localEnv)
            end
            return result

    elseif node.type == "FunctionDeclaration" then
        local fn = function(...)
            local args = { ... }
            local funcEnv = setmetatable({}, { __index = localEnv })
            for i, param in ipairs(node.params) do
                funcEnv[param] = args[i]
            end
            for _, stmt in ipairs(node.body) do
                local r = evalNode(stmt, funcEnv)
                if stmt.type == "ReturnStatement" then
                    return r
                end
            end
            return nil
        end
        localEnv[node.name] = fn
        return fn

        elseif node.type == "ReturnStatement" then
            return evalNode(node.expression, localEnv)

        elseif node.type == "BinaryExpression" then
            local l = evalNode(node.left, localEnv)
            local r = evalNode(node.right, localEnv)
            if node.operator == "+" then return l + r
            elseif node.operator == "-" then return l - r
            elseif node.operator == "*" then return l * r
            elseif node.operator == "/" then return l / r
            elseif node.operator == ">" then return l > r
            elseif node.operator == "<" then return l < r
            else return nil
            end

        elseif node.type == "Identifier" then
            return localEnv[node.name]

        elseif node.type == "NumberLiteral" then
            return node.value

        elseif node.type == "IfStatement" then
            if evalNode(node.test, localEnv) then
                for _, stmt in ipairs(node.consequent) do
                    local r = evalNode(stmt, localEnv)
                    if stmt.type == "ReturnStatement" then return r end
                end
            elseif node.alternate then
                for _, stmt in ipairs(node.alternate) do
                    local r = evalNode(stmt, localEnv)
                    if stmt.type == "ReturnStatement" then return r end
                end
            end
            return nil

        elseif node.type == "AssignmentStatement" then
            localEnv[node.name] = evalNode(node.value, localEnv)
            return localEnv[node.name]

        elseif node.type == "CallExpression" then
            local fn = evalNode(node.callee, localEnv)
            local args = {}
            for _, arg in ipairs(node.arguments) do
                table.insert(args, evalNode(arg, localEnv))
            end
            return fn(table.unpack(args))

        else
            return nil
        end
    end

    return evalNode(ast, env)
end

local result = eval(ast, {})
print(result)