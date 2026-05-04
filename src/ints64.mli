(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module Int64 of the stdlib *)

type t = int64

val range : int64 -> int64 -> int64

module Infix : sig
  val ( + ) : int64 -> int64 -> int64
  val ( - ) : int64 -> int64 -> int64
  val ( * ) : int64 -> int64 -> int64
  val ( / ) : int64 -> int64 -> int64
  val ( << ) : int64 -> int -> int64
  val ( >> ) : int64 -> int -> int64
end
