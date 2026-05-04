(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions for the type [Pervasives] of the stdlib *)

exception Failed_with of string * string
(** the first parameter should be the function name,
    and the second one an explanation *)

val failhere : string -> string -> 'a
(** [Pervasive.failhere func_name explanation], raises the [Failed_with] exception *)

module Labels : sig
  val failhere : func_name:string -> explanation:string -> 'a
end
