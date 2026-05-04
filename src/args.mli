(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Parsing command line arguments in a functional way. *)

(** for non-[Acc] kinds if an argument is given several times on the
    command line the last one overwrites the previous ones *)
type kind =
  | Int
  | Float
  | String
  | Set_true  (** [get_bool] will return [true] for this arg *)
  | Set_false  (** [get_bool] will return [false] for this arg *)
  | Custom of string 
    (** the string after this constructor gives
        clue to the user about the expected type *)
  | StringAcc
    (** This command will accumulate the parameters when
        several ones are provided on the command line. *)

type p =
  | Default of string
  | Defaults of string list
  | Required
  | Optional

type spec = string * p * kind * string
(** [(command_line_argument, about_value, kind, help_msg)] *)

type args = string list
(** typically [Sys.args] *)

type cmd

val parse : spec list -> args -> cmd

val usage : spec list -> unit

(** {5 Accessors} *)

(** The string should be the same than the first element of
    the [spec] entry *)

val get_int : cmd -> string -> int
val get_float : cmd -> string -> float
val get_bool : cmd -> string -> bool
val get_string : cmd -> string -> string

val get_custom : (string -> 'a) -> cmd -> string -> 'a

val get_string_list : cmd -> string -> string list

(** Option *)

val get_int_opt : cmd -> string -> int option
val get_float_opt : cmd -> string -> float option
val get_bool_opt : cmd -> string -> bool option
val get_string_opt : cmd -> string -> string option

val get_custom_opt : (string -> 'a) -> cmd -> string -> 'a option

