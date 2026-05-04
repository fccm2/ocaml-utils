(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module Array of the stdlib *)

val map2 : ('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array
(** [Arrays.map2 f a b], returns an array [c], of same length
    than arrays [a] and [b], with every cell initialised with
    the application of [f]. *)

val unsafe_blit : 'a array -> int -> 'a array -> int -> int -> unit
(** function from the stdlib but that is not exported
    in the std-interface. *)

