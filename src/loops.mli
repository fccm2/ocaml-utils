(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional [Loops] functions for the stdlib, *)

val fold_left : ('a -> int -> 'a) -> 'a -> int -> 'a
val iter : (unit -> 'a) -> int -> unit
val iteri : (int -> 'a) -> int -> unit
