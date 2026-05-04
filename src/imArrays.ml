(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

type 'a t = 'a array

let map2 f ar1 ar2 =
  let n1 = Array.length ar1
  and n2 = Array.length ar2 in
  if n1 <> n2 then invalid_arg "Array.map2" else
  Array.init n1 (fun i ->
    let v1 = Array.unsafe_get ar1 i
    and v2 = Array.unsafe_get ar2 i in
    (f v1 v2)
  )

let sort cmp arr =
  let arr2 = Array.copy arr in
  Array.sort cmp arr2;
  (arr2)

let stable_sort cmp arr =
  let arr2 = Array.copy arr in
  Array.stable_sort cmp arr2;
  (arr2)

let fast_sort cmp arr =
  let arr2 = Array.copy arr in
  Array.fast_sort cmp arr2;
  (arr2)

