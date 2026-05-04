(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module Array of the stdlib, for immutable arrays *)

type 'a t
val map2 : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t
val sort : ('a -> 'a -> int) -> 'a t -> 'a t
val stable_sort : ('a -> 'a -> int) -> 'a t -> 'a t
val fast_sort : ('a -> 'a -> int) -> 'a t -> 'a t
