
(* The type of tokens. *)

type token = 
  | Star
  | Slash
  | Semicolon
  | Return
  | RParen
  | RBrace
  | Plus
  | Number of (float)
  | Minus
  | Lambda
  | LParen
  | LBrace
  | If
  | Identifier of (string)
  | Func
  | Equal
  | Else
  | EOF
  | Comma
  | Arrow

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (program)
