
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | Star
    | Slash
    | Semicolon
    | Return
    | RParen
    | RBrace
    | Plus
    | Number of (
# 24 "parser.mly"
       (float)
# 22 "parser.ml"
  )
    | Minus
    | Lambda
    | LParen
    | LBrace
    | If
    | Identifier of (
# 23 "parser.mly"
       (string)
# 32 "parser.ml"
  )
    | Func
    | Equal
    | Else
    | EOF
    | Comma
    | Arrow
  
end

include MenhirBasics

# 1 "parser.mly"
  

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

# 63 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState00 : ('s, _menhir_box_program) _menhir_state
    (** State 00.
        Stack shape : .
        Start symbol: program. *)

  | MenhirState01 : (('s, _menhir_box_program) _menhir_cell1_Return, _menhir_box_program) _menhir_state
    (** State 01.
        Stack shape : Return.
        Start symbol: program. *)

  | MenhirState06 : (('s, _menhir_box_program) _menhir_cell1_Lambda _menhir_cell0_Identifier, _menhir_box_program) _menhir_state
    (** State 06.
        Stack shape : Lambda Identifier.
        Start symbol: program. *)

  | MenhirState07 : (('s, _menhir_box_program) _menhir_cell1_LParen, _menhir_box_program) _menhir_state
    (** State 07.
        Stack shape : LParen.
        Start symbol: program. *)

  | MenhirState09 : ((('s, _menhir_box_program) _menhir_cell1_LParen, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 09.
        Stack shape : LParen expr.
        Start symbol: program. *)

  | MenhirState10 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Star, _menhir_box_program) _menhir_state
    (** State 10.
        Stack shape : expr Star.
        Start symbol: program. *)

  | MenhirState11 : (((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Star, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 11.
        Stack shape : expr Star expr.
        Start symbol: program. *)

  | MenhirState12 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_LParen, _menhir_box_program) _menhir_state
    (** State 12.
        Stack shape : expr LParen.
        Start symbol: program. *)

  | MenhirState13 : (('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 13.
        Stack shape : expr.
        Start symbol: program. *)

  | MenhirState14 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Slash, _menhir_box_program) _menhir_state
    (** State 14.
        Stack shape : expr Slash.
        Start symbol: program. *)

  | MenhirState15 : (((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Slash, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 15.
        Stack shape : expr Slash expr.
        Start symbol: program. *)

  | MenhirState16 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Equal, _menhir_box_program) _menhir_state
    (** State 16.
        Stack shape : expr Equal.
        Start symbol: program. *)

  | MenhirState17 : (((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Equal, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 17.
        Stack shape : expr Equal expr.
        Start symbol: program. *)

  | MenhirState18 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Plus, _menhir_box_program) _menhir_state
    (** State 18.
        Stack shape : expr Plus.
        Start symbol: program. *)

  | MenhirState19 : (((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Plus, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 19.
        Stack shape : expr Plus expr.
        Start symbol: program. *)

  | MenhirState20 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Minus, _menhir_box_program) _menhir_state
    (** State 20.
        Stack shape : expr Minus.
        Start symbol: program. *)

  | MenhirState21 : (((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Minus, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 21.
        Stack shape : expr Minus expr.
        Start symbol: program. *)

  | MenhirState22 : ((('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Comma, _menhir_box_program) _menhir_state
    (** State 22.
        Stack shape : expr Comma.
        Start symbol: program. *)

  | MenhirState28 : ((('s, _menhir_box_program) _menhir_cell1_Lambda _menhir_cell0_Identifier, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 28.
        Stack shape : Lambda Identifier expr.
        Start symbol: program. *)

  | MenhirState30 : ((('s, _menhir_box_program) _menhir_cell1_Return, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 30.
        Stack shape : Return expr.
        Start symbol: program. *)

  | MenhirState32 : (('s, _menhir_box_program) _menhir_cell1_If, _menhir_box_program) _menhir_state
    (** State 32.
        Stack shape : If.
        Start symbol: program. *)

  | MenhirState33 : ((('s, _menhir_box_program) _menhir_cell1_If, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 33.
        Stack shape : If expr.
        Start symbol: program. *)

  | MenhirState34 : (('s, _menhir_box_program) _menhir_cell1_LBrace, _menhir_box_program) _menhir_state
    (** State 34.
        Stack shape : LBrace.
        Start symbol: program. *)

  | MenhirState37 : (('s, _menhir_box_program) _menhir_cell1_Func _menhir_cell0_Identifier, _menhir_box_program) _menhir_state
    (** State 37.
        Stack shape : Func Identifier.
        Start symbol: program. *)

  | MenhirState40 : (('s, _menhir_box_program) _menhir_cell1_Identifier, _menhir_box_program) _menhir_state
    (** State 40.
        Stack shape : Identifier.
        Start symbol: program. *)

  | MenhirState44 : (('s, _menhir_box_program) _menhir_cell1_Func _menhir_cell0_Identifier _menhir_cell0_params, _menhir_box_program) _menhir_state
    (** State 44.
        Stack shape : Func Identifier params.
        Start symbol: program. *)

  | MenhirState48 : (('s, _menhir_box_program) _menhir_cell1_stmt, _menhir_box_program) _menhir_state
    (** State 48.
        Stack shape : stmt.
        Start symbol: program. *)

  | MenhirState50 : (('s, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_state
    (** State 50.
        Stack shape : expr.
        Start symbol: program. *)

  | MenhirState53 : (((('s, _menhir_box_program) _menhir_cell1_If, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_block, _menhir_box_program) _menhir_state
    (** State 53.
        Stack shape : If expr block.
        Start symbol: program. *)


and ('s, 'r) _menhir_cell1_block = 
  | MenhirCell1_block of 's * ('s, 'r) _menhir_state * (program)

and ('s, 'r) _menhir_cell1_expr = 
  | MenhirCell1_expr of 's * ('s, 'r) _menhir_state * (expr)

and 's _menhir_cell0_params = 
  | MenhirCell0_params of 's * (string list)

and ('s, 'r) _menhir_cell1_stmt = 
  | MenhirCell1_stmt of 's * ('s, 'r) _menhir_state * (stmt)

and ('s, 'r) _menhir_cell1_Comma = 
  | MenhirCell1_Comma of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Equal = 
  | MenhirCell1_Equal of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Func = 
  | MenhirCell1_Func of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Identifier = 
  | MenhirCell1_Identifier of 's * ('s, 'r) _menhir_state * (
# 23 "parser.mly"
       (string)
# 237 "parser.ml"
)

and 's _menhir_cell0_Identifier = 
  | MenhirCell0_Identifier of 's * (
# 23 "parser.mly"
       (string)
# 244 "parser.ml"
)

and ('s, 'r) _menhir_cell1_If = 
  | MenhirCell1_If of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LBrace = 
  | MenhirCell1_LBrace of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LParen = 
  | MenhirCell1_LParen of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Lambda = 
  | MenhirCell1_Lambda of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Minus = 
  | MenhirCell1_Minus of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Plus = 
  | MenhirCell1_Plus of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Return = 
  | MenhirCell1_Return of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Slash = 
  | MenhirCell1_Slash of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_Star = 
  | MenhirCell1_Star of 's * ('s, 'r) _menhir_state

and _menhir_box_program = 
  | MenhirBox_program of (program) [@@unboxed]

let _menhir_action_01 =
  fun _1 ->
    (
# 102 "parser.mly"
                              ( [_1] )
# 282 "parser.ml"
     : (expr list))

let _menhir_action_02 =
  fun _1 _3 ->
    (
# 103 "parser.mly"
                               ( _1 :: _3 )
# 290 "parser.ml"
     : (expr list))

let _menhir_action_03 =
  fun _2 ->
    (
# 73 "parser.mly"
                      ( _2 )
# 298 "parser.ml"
     : (program))

let _menhir_action_04 =
  fun () ->
    (
# 98 "parser.mly"
                              ( [] )
# 306 "parser.ml"
     : (expr list))

let _menhir_action_05 =
  fun _1 ->
    (
# 99 "parser.mly"
                              ( _1 )
# 314 "parser.ml"
     : (expr list))

let _menhir_action_06 =
  fun () ->
    (
# 69 "parser.mly"
              ( [] )
# 322 "parser.ml"
     : (program))

let _menhir_action_07 =
  fun _2 ->
    (
# 70 "parser.mly"
              ( _2 )
# 330 "parser.ml"
     : (program))

let _menhir_action_08 =
  fun _1 ->
    (
# 84 "parser.mly"
                              ( Number _1 )
# 338 "parser.ml"
     : (expr))

let _menhir_action_09 =
  fun _1 ->
    (
# 85 "parser.mly"
                              ( Ident _1 )
# 346 "parser.ml"
     : (expr))

let _menhir_action_10 =
  fun _2 _4 ->
    (
# 87 "parser.mly"
    ( Lambda (_2, _4) )
# 354 "parser.ml"
     : (expr))

let _menhir_action_11 =
  fun _1 _3 ->
    (
# 88 "parser.mly"
                              ( Binop ("+", _1, _3) )
# 362 "parser.ml"
     : (expr))

let _menhir_action_12 =
  fun _1 _3 ->
    (
# 89 "parser.mly"
                              ( Binop ("-", _1, _3) )
# 370 "parser.ml"
     : (expr))

let _menhir_action_13 =
  fun _1 _3 ->
    (
# 90 "parser.mly"
                              ( Binop ("*", _1, _3) )
# 378 "parser.ml"
     : (expr))

let _menhir_action_14 =
  fun _1 _3 ->
    (
# 91 "parser.mly"
                              ( Binop ("/", _1, _3) )
# 386 "parser.ml"
     : (expr))

let _menhir_action_15 =
  fun _1 _3 ->
    (
# 92 "parser.mly"
                              ( Binop ("=", _1, _3) )
# 394 "parser.ml"
     : (expr))

let _menhir_action_16 =
  fun _2 ->
    (
# 93 "parser.mly"
                              ( _2 )
# 402 "parser.ml"
     : (expr))

let _menhir_action_17 =
  fun _1 _3 ->
    (
# 95 "parser.mly"
    ( Call (_1, _3) )
# 410 "parser.ml"
     : (expr))

let _menhir_action_18 =
  fun _1 ->
    (
# 80 "parser.mly"
                              ( [_1] )
# 418 "parser.ml"
     : (string list))

let _menhir_action_19 =
  fun _1 _3 ->
    (
# 81 "parser.mly"
                              ( _1 :: _3 )
# 426 "parser.ml"
     : (string list))

let _menhir_action_20 =
  fun () ->
    (
# 76 "parser.mly"
                              ( [] )
# 434 "parser.ml"
     : (string list))

let _menhir_action_21 =
  fun _2 ->
    (
# 77 "parser.mly"
                              ( _2 )
# 442 "parser.ml"
     : (string list))

let _menhir_action_22 =
  fun _1 ->
    (
# 50 "parser.mly"
            ( _1 )
# 450 "parser.ml"
     : (program))

let _menhir_action_23 =
  fun () ->
    (
# 65 "parser.mly"
            ( () )
# 458 "parser.ml"
     : (unit))

let _menhir_action_24 =
  fun () ->
    (
# 66 "parser.mly"
              ( () )
# 466 "parser.ml"
     : (unit))

let _menhir_action_25 =
  fun _1 ->
    (
# 57 "parser.mly"
                             ( ExprStmt _1 )
# 474 "parser.ml"
     : (stmt))

let _menhir_action_26 =
  fun () ->
    (
# 58 "parser.mly"
                             ( Return None )
# 482 "parser.ml"
     : (stmt))

let _menhir_action_27 =
  fun _2 ->
    (
# 59 "parser.mly"
                             ( Return (Some _2) )
# 490 "parser.ml"
     : (stmt))

let _menhir_action_28 =
  fun _2 _3 _4 ->
    (
# 60 "parser.mly"
                             ( If (_2, _3, _4) )
# 498 "parser.ml"
     : (stmt))

let _menhir_action_29 =
  fun _2 _3 _4 ->
    (
# 62 "parser.mly"
    ( Func (_2, _3, _4) )
# 506 "parser.ml"
     : (stmt))

let _menhir_action_30 =
  fun () ->
    (
# 53 "parser.mly"
              ( [] )
# 514 "parser.ml"
     : (program))

let _menhir_action_31 =
  fun _1 _2 ->
    (
# 54 "parser.mly"
             ( _1 :: _2 )
# 522 "parser.ml"
     : (program))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | Arrow ->
        "Arrow"
    | Comma ->
        "Comma"
    | EOF ->
        "EOF"
    | Else ->
        "Else"
    | Equal ->
        "Equal"
    | Func ->
        "Func"
    | Identifier _ ->
        "Identifier"
    | If ->
        "If"
    | LBrace ->
        "LBrace"
    | LParen ->
        "LParen"
    | Lambda ->
        "Lambda"
    | Minus ->
        "Minus"
    | Number _ ->
        "Number"
    | Plus ->
        "Plus"
    | RBrace ->
        "RBrace"
    | RParen ->
        "RParen"
    | Return ->
        "Return"
    | Semicolon ->
        "Semicolon"
    | Slash ->
        "Slash"
    | Star ->
        "Star"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_56 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let _1 = _v in
          let _v = _menhir_action_22 _1 in
          MenhirBox_program _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Return (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Semicolon ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState01
      | EOF | Func | If | RBrace | Return ->
          let _ = _menhir_action_24 () in
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_02 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _ = _menhir_action_23 () in
      _menhir_goto_semi_opt _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok
  
  and _menhir_goto_semi_opt : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s _tok ->
      match _menhir_s with
      | MenhirState50 ->
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState30 ->
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | MenhirState01 ->
          _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_51 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _v = _menhir_action_25 _1 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stmt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_stmt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Return ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | Number _v_0 ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState48
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | If ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | Identifier _v_1 ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState48
      | Func ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState48
      | EOF | RBrace ->
          let _v_2 = _menhir_action_30 () in
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_08 _1 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState34 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState48 ->
          _menhir_run_50 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState32 ->
          _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState01 ->
          _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState06 ->
          _menhir_run_28 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState20 ->
          _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState18 ->
          _menhir_run_19 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState16 ->
          _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState14 ->
          _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState22 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState12 ->
          _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState10 ->
          _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState07 ->
          _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_50 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Star ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | Slash ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | Semicolon ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | Plus ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | Minus ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | LParen ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | Equal ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState50
      | EOF | Func | Identifier _ | If | Lambda | Number _ | RBrace | Return ->
          let _ = _menhir_action_24 () in
          _menhir_run_51 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_10 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Star (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState10 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_04 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Lambda (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Identifier _v ->
          let _menhir_stack = MenhirCell0_Identifier (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Arrow ->
              let _menhir_s = MenhirState06 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | Number _v ->
                  _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | Lambda ->
                  _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LParen ->
                  _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | Identifier _v ->
                  _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_07 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState07 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _1 = _v in
      let _v = _menhir_action_09 _1 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_14 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Slash (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState14 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_18 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Plus (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState18 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_20 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Minus (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState20 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_12 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LParen (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState12 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | RParen ->
          let _v = _menhir_action_04 () in
          _menhir_goto_call_args _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_goto_call_args : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_LParen -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LParen (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_17 _1 _3 in
      _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_16 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Equal (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState16 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_33 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_If as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Star ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | Slash ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | Plus ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | Minus ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | LParen ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | LBrace ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | Equal ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState33
      | _ ->
          _eRR ()
  
  and _menhir_run_34 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LBrace (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Return ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | If ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState34
      | Func ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState34
      | RBrace ->
          let _v = _menhir_action_30 () in
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_If (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState32 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_35 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_Func (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Identifier _v ->
          let _menhir_stack = MenhirCell0_Identifier (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LParen ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RParen ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_20 () in
                  _menhir_goto_params _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | Identifier _v_1 ->
                  _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState37
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_params : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_Func _menhir_cell0_Identifier -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_params (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | LBrace ->
          _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState44
      | _ ->
          _eRR ()
  
  and _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Comma ->
          let _menhir_stack = MenhirCell1_Identifier (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState40 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Identifier _v ->
              _menhir_run_39 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RParen ->
          let _1 = _v in
          let _v = _menhir_action_18 _1 in
          _menhir_goto_param_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_param_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState37 ->
          _menhir_run_42 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState40 ->
          _menhir_run_41 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_42 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_Func _menhir_cell0_Identifier -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _2 = _v in
      let _v = _menhir_action_21 _2 in
      _menhir_goto_params _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_41 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_Identifier -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Identifier (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_19 _1 _3 in
      _menhir_goto_param_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_46 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_LBrace -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RBrace ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBrace (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_03 _2 in
          _menhir_goto_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_block : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState53 ->
          _menhir_run_54 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState33 ->
          _menhir_run_52 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState44 ->
          _menhir_run_45 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_54 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_If, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _2 = _v in
      let _v = _menhir_action_07 _2 in
      _menhir_goto_else_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_else_block : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_If, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_block -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_block (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_If (_menhir_stack, _menhir_s) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_28 _2 _3 _4 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_52 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_If, _menhir_box_program) _menhir_cell1_expr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_block (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Else ->
          let _menhir_s = MenhirState53 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBrace ->
              _menhir_run_34 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | EOF | Func | Identifier _ | If | LParen | Lambda | Number _ | RBrace | Return ->
          let _v = _menhir_action_06 () in
          _menhir_goto_else_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_45 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_Func _menhir_cell0_Identifier _menhir_cell0_params -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_params (_menhir_stack, _3) = _menhir_stack in
      let MenhirCell0_Identifier (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_Func (_menhir_stack, _menhir_s) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_29 _2 _3 _4 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_30 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_Return as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | Star ->
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Slash ->
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Semicolon ->
          _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Plus ->
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Minus ->
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | LParen ->
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | Equal ->
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState30
      | EOF | Func | Identifier _ | If | Lambda | Number _ | RBrace | Return ->
          let _ = _menhir_action_24 () in
          _menhir_run_31 _menhir_stack _menhir_lexbuf _menhir_lexer _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_31 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_Return, _menhir_box_program) _menhir_cell1_expr -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_expr (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_Return (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_27 _2 in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_28 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_Lambda _menhir_cell0_Identifier as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Star ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | Slash ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | Plus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | Minus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState28
      | Comma | EOF | Func | Identifier _ | If | LBrace | Lambda | Number _ | RBrace | RParen | Return | Semicolon ->
          let MenhirCell0_Identifier (_menhir_stack, _2) = _menhir_stack in
          let MenhirCell1_Lambda (_menhir_stack, _menhir_s) = _menhir_stack in
          let _4 = _v in
          let _v = _menhir_action_10 _2 _4 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_21 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Minus as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Star ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | Slash ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
      | Comma | EOF | Func | Identifier _ | If | LBrace | Lambda | Minus | Number _ | Plus | RBrace | RParen | Return | Semicolon ->
          let MenhirCell1_Minus (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_12 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_19 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Plus as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Star ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | Slash ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState19
      | Comma | EOF | Func | Identifier _ | If | LBrace | Lambda | Minus | Number _ | Plus | RBrace | RParen | Return | Semicolon ->
          let MenhirCell1_Plus (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_11 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_17 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Equal as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Star ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | Slash ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | Plus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | Minus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
      | Comma | EOF | Func | Identifier _ | If | LBrace | Lambda | Number _ | RBrace | RParen | Return | Semicolon ->
          let MenhirCell1_Equal (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_15 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_15 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Slash as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState15
      | Comma | EOF | Func | Identifier _ | If | LBrace | Lambda | Minus | Number _ | Plus | RBrace | RParen | Return | Semicolon | Slash | Star ->
          let MenhirCell1_Slash (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_14 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Star ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | Slash ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | Plus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | Minus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState13
      | Comma ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          let _menhir_stack = MenhirCell1_Comma (_menhir_stack, MenhirState13) in
          let _menhir_s = MenhirState22 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | Number _v ->
              _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | Lambda ->
              _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LParen ->
              _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | Identifier _v ->
              _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RParen ->
          let _1 = _v in
          let _v = _menhir_action_01 _1 in
          _menhir_goto_arg_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_arg_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState12 ->
          _menhir_run_26 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState22 ->
          _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_26 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_LParen -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _1 = _v in
      let _v = _menhir_action_05 _1 in
      _menhir_goto_call_args _menhir_stack _menhir_lexbuf _menhir_lexer _v
  
  and _menhir_run_23 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Comma -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_Comma (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_02 _1 _3 in
      _menhir_goto_arg_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_11 : type  ttv_stack. (((ttv_stack, _menhir_box_program) _menhir_cell1_expr, _menhir_box_program) _menhir_cell1_Star as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState11
      | Comma | EOF | Func | Identifier _ | If | LBrace | Lambda | Minus | Number _ | Plus | RBrace | RParen | Return | Semicolon | Slash | Star ->
          let MenhirCell1_Star (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_expr (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_13 _1 _3 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_09 : type  ttv_stack. ((ttv_stack, _menhir_box_program) _menhir_cell1_LParen as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | Star ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | Slash ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_14 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | RParen ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LParen (_menhir_stack, _menhir_s) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_16 _2 in
          _menhir_goto_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | Plus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | Minus ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | LParen ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | Equal ->
          let _menhir_stack = MenhirCell1_expr (_menhir_stack, _menhir_s, _v) in
          _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
      | _ ->
          _eRR ()
  
  and _menhir_run_49 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_stmt -> _ -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_stmt (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_31 _1 _2 in
      _menhir_goto_stmts _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_stmts : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_program) _menhir_state -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState00 ->
          _menhir_run_56 _menhir_stack _v _tok
      | MenhirState48 ->
          _menhir_run_49 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState34 ->
          _menhir_run_46 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_29 : type  ttv_stack. (ttv_stack, _menhir_box_program) _menhir_cell1_Return -> _ -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _tok ->
      let MenhirCell1_Return (_menhir_stack, _menhir_s) = _menhir_stack in
      let _v = _menhir_action_26 () in
      _menhir_goto_stmt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_program =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | Return ->
          _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | Number _v ->
          _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | Lambda ->
          _menhir_run_04 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | LParen ->
          _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | If ->
          _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | Identifier _v ->
          _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
      | Func ->
          _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
      | EOF ->
          let _v = _menhir_action_30 () in
          _menhir_run_56 _menhir_stack _v _tok
      | _ ->
          _eRR ()
  
end

let program =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_program v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
