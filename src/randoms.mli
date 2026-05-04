(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module Random of the stdlib *)

val init_bak : unit -> string
val bak_init : string -> unit
val prob_total : ('a -> float) -> 'a list -> float
val prob_take : ('a -> float) -> 'a list -> 'a
val prob_extract : ('a -> float) -> 'a list -> 'a * 'a list

module Int : sig
  val range : int -> int -> int
end

module Float : sig
  val range : float -> float -> float
end

module Int32 : sig
  external ( + ) : int32 -> int32 -> int32 = "%int32_add"
  external ( - ) : int32 -> int32 -> int32 = "%int32_sub"
  val range : int32 -> int32 -> int32
end

module Int64 : sig
  external ( + ) : int64 -> int64 -> int64 = "%int64_add"
  external ( - ) : int64 -> int64 -> int64 = "%int64_sub"
  val range : int64 -> int64 -> int64
end

module List : sig
  val take : 'a list -> 'a
end

module Array : sig
  val take : 'a array -> 'a
end

