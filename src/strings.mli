(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module String of the stdlib *)

val set : string -> int -> char -> string
val create : int -> string
val init : int -> (int -> char) -> string
val fold_left : ('a -> char -> 'a) -> 'a -> string -> 'a
val nth : string -> int -> char option
val nth_is : string -> int -> char -> bool
val char_index_from : string -> int -> char -> int option
val char_rindex_from : string -> int -> char -> int option
val char_index_all : string -> char -> int list
val char_split : char -> string -> string list
val char_splitter : char -> string -> string list
val char_cut : char -> string -> (string * string) option
val char_rcut : char -> string -> (string * string) option
val starts_with : string -> string -> bool
val ends_with : string -> string -> bool
val sub_opt : string -> int -> int -> string option
val sub_is : string -> int -> int -> string -> bool
val str_split : string -> string -> string list
val str_cut : string -> string -> (string * string) option
val last_ofs : string -> int
val valid_ofs : string -> int -> bool
val string_index_from : string -> int -> string -> int option
val string_rindex_from : string -> int -> string -> int option
val string_index : string -> string -> int option
val string_rindex : string -> string -> int option

val uppercase_utf8 : string -> string
val str_replace : string -> (string * string) list -> string

