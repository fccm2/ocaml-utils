(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

let map2 f ar1 ar2 =
  let n1 = Array.length ar1
  and n2 = Array.length ar2 in
  if n1 <> n2 then invalid_arg "Array.map2" else
  Array.init n1 (fun i ->
    let v1 = Array.unsafe_get ar1 i
    and v2 = Array.unsafe_get ar2 i in
    (f v1 v2)
  )

external unsafe_blit :
  'a array -> int -> 'a array -> int -> int -> unit
  = "caml_array_blit"
(* function from the stdlib but that is not exported
   in the std interface *)

