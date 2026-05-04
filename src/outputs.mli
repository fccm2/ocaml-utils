(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions for the stdlib, to output files and from output-channels *)

type t = out_channel
val write_file : string -> string -> unit
val write_file_bin : string -> string -> unit

module Infix : sig
  val ( << ) : out_channel -> string -> unit
end
