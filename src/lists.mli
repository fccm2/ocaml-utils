(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module List of the stdlib *)

val init : int -> (int -> 'a) -> 'a list
(** similar than [Array.init], but for lists. *)

val return : ('a -> 'b option) -> 'a list -> 'b
(** similar than List.find, but returns the result
    of the function application,
    @raise Not_found if not found *)

val return_opt : ('a -> 'b option) -> 'a list -> 'b option
(** same than [Lists.return], but returns the result
    with an [option] type, instead of raising an exception. *)

val map_opt : ('a -> 'b option) -> 'a list -> 'b list
(** equivalent than appling [List.map] and [List.filter]. *)

val take : int -> 'a list -> 'a list
(** [Lists.take n lst] returns the [n]-th first elements of [lst],
    @raise Failure "take" if there are less than [n] elements in [lst] *)

val drop : int -> 'a list -> 'a list
(** [Lists.drop n lst]  removes the [n]-th first elements of [lst],
    @raise Failure "drop" if there are no [n] elements to remove from [lst] *)

val starts_with : 'a list -> 'a list -> bool

val uniq : 'a list -> 'a list
val index : 'a -> 'a list -> int list
val assoc_err : 'a -> ('a * 'b) list -> err:string -> 'b
val assoc_default : 'a -> 'b -> ('a * 'b) list -> 'b
val assoc_replace : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list

