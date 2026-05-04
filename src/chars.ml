(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

let is_alpha = function
  | 'a'..'z' | 'A'..'Z' | '_' -> true
  | _ -> false

let is_num = function
  | '0'..'9' -> true
  | _ -> false

let is_alpha_num = function
  | 'a'..'z' | 'A'..'Z' | '_'
  | '0'..'9' -> true
  | _ -> false

let is_hex_num = function
  | 'a'..'f' | 'A'..'F'
  | '0'..'9' -> true
  | _ -> false

