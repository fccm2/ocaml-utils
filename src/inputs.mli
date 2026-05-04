(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions for the stdlib, to input files and from input-channels *)

type t = in_channel
val read_file : string -> string
val read_file_bin : string -> string
val input_line : in_channel -> string option
val input_lines : in_channel -> string list
val lines_of_file : string -> string list
val input_channel : in_channel -> string
val line : in_channel -> string option
val lines : in_channel -> string list

