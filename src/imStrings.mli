(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module String of the stdlib, for immutable strings *)

type t

val to_string : t -> string
val of_string : string -> t

val init : int -> (int -> char) -> t

val fold_left : ('a -> char -> 'a) -> 'a -> t -> 'a

val nth : t -> int -> char option
(** get the nth char of a string in an exceptionless way *)

val nth_is : t -> int -> char -> bool
(** [String.nth_is s ofs c] returns true if the nth char is [c] *)

val char_rindex_from : t -> int -> char -> int option

val char_index_from : t -> int -> char -> int option

val char_index_all : t -> char -> int list

val char_split : char -> t -> t list
(** [char_split s c] splits the string [s] wherever the character
    [c] appears *)

val char_splitter : char -> t -> t list
(** same than [char_split] but also [String.trim]s all strings
    and filters out all empty strings *)

val char_cut : char -> t -> (t * t) option
(** cut the string at the first occurence of the char *)

val char_rcut : char -> t -> (t * t) option
(** cut the string at the last occurence of the char *)

val starts_with : t -> t -> bool
(** [starts_with sub s] returns true if [s] starts with [sub] *)

val ends_with : t -> t -> bool
(** [ends_with sub s] returns true if [s] ends with [sub] *)

val str_split : t -> t -> t list
val str_cut : t -> t -> (t * t) option

val string_index : t -> t -> int option
val string_rindex : t -> t -> int option

val string_index_from : t -> int -> t -> int option
val string_rindex_from : t -> int -> t -> int option

(*
val of_string : string -> string
val to_string : string -> string
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
*)
