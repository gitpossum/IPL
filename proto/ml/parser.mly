%{
type expr =
  | Number of float
  | Ident of string
  | Binop of string * expr * expr
  | Lambda of string * expr
  | Call of expr * expr list

type stmt =
  | ExprStmt of expr
  | Return of expr option
  | If of expr * stmt list * stmt list
  | Func of string * string list * stmt list

type program = stmt list
%}

%token If Else Func Return
%token Plus Minus Star Slash Equal
%token LParen RParen LBrace RBrace
%token Lambda
%token <string> Identifier
%token <float> Number
%token EOF
%token Semicolon
%token Comma
%token Arrow

%start program
%type <program> program

%type <stmt list> stmts
%type <stmt> stmt
%type <expr> expr
%type <stmt list> block
%type <stmt list> else_block
%type <string list> params
%type <string list> param_list
%type <expr list> call_args
%type <expr list> arg_list
%type <unit> semi_opt

%left Plus Minus
%left Star Slash

%%

program:
| stmts EOF { $1 }

stmts:
| /* empty */ { [] }
| stmt stmts { $1 :: $2 }

stmt:
| expr semi_opt              { ExprStmt $1 }
| Return semi_opt            { Return None }
| Return expr semi_opt       { Return (Some $2) }
| If expr block else_block   { If ($2, $3, $4) }
| Func Identifier params block
    { Func ($2, $3, $4) }

semi_opt:
| Semicolon { () }
| /* empty */ { () }

else_block:
| /* empty */ { [] }
| Else block  { $2 }

block:
| LBrace stmts RBrace { $2 }

params:
| LParen RParen               { [] }
| LParen param_list RParen    { $2 }

param_list:
| Identifier                  { [$1] }
| Identifier Comma param_list { $1 :: $3 }

expr:
| Number                      { Number $1 }
| Identifier                  { Ident $1 }
| Lambda Identifier Arrow expr
    { Lambda ($2, $4) }
| expr Plus expr              { Binop ("+", $1, $3) }
| expr Minus expr             { Binop ("-", $1, $3) }
| expr Star expr              { Binop ("*", $1, $3) }
| expr Slash expr             { Binop ("/", $1, $3) }
| expr Equal expr             { Binop ("=", $1, $3) }
| LParen expr RParen          { $2 }
| expr LParen call_args RParen
    { Call ($1, $3) }

call_args:
| /* empty */                 { [] }
| arg_list                    { $1 }

arg_list:
| expr                        { [$1] }
| expr Comma arg_list          { $1 :: $3 }