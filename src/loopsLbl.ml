(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

let fold_left ~f ~init n =
  let rec aux acc i =
    if i >= n then (acc)
    else aux (f acc i) (succ i)
  in
  aux init 0

let iter ~f n =
  for i = 1 to n do
    f ()
  done

let iteri ~f n =
  for i = 0 to pred n do
    f i
  done

