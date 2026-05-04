(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

type t = out_channel

let write_file filename s =
  let oc = open_out filename in
  output_string oc s;
  close_out oc

let write_file_bin filename s =
  let oc = open_out_bin filename in
  output_string oc s;
  close_out oc

module Infix = struct
  let ( << ) = output_string
end

