(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the module String of the stdlib *)

let create n =
  String.make n ' '

let set str pos c =
  let len = String.length str in
  let s1 = String.sub str 0 (pos) in
  let s3 = String.sub str (pos+1) (len - pos - 1) in
  let s2 = String.make 1 c in
  (s1 ^ s2 ^ s3)

let unsafe_set = set

let init n f =
  let s = create n in
  let rec aux i s =
    if i >= n then s else
    let s = unsafe_set s i (f i) in
    aux (succ i) s
  in
  aux 0 s

let fold_left f init s =
  let n = String.length s in
  let rec aux acc i =
    if i >= n then acc else
    let c = String.unsafe_get s i in
    aux (f acc c) (i+1)
  in
  aux init 0

let nth s n =
  let len = String.length s in
  if n < len then Some (String.unsafe_get s n)
  else None

let nth_is s n c =
  let len = String.length s in
  if n < len then (c = String.unsafe_get s n)
  else false

(*
let rec index_rec s len i c =
  if i >= len then None else
  if String.unsafe_get s i = c then (Some i)
  else index_rec s len (i + 1) c

let index s c =
  index_rec s (String.length s) 0 c

let index_from s i c =
  let len = String.length s in
  if i < 0 || i >= len then None
  else index_rec s len i c

let rec rindex_rec s i c =
  if i < 0 then None else
  if unsafe_get s i = c then (Some i)
  else rindex_rec s (i - 1) c

let rindex s c =
  rindex_rec s (String.length s - 1) c

let rindex_from s i c =
  if i < -1 || i >= String.length s then None
  else rindex_rec s i c
*)

let char_index_from s i c =
  try Some (String.index_from s i c)
  with Not_found -> None

let char_rindex_from s i c =
  try Some (String.rindex_from s i c)
  with Not_found -> None

let char_index_all s c =
  let n = String.length s in
  let rec aux acc i =
    match char_rindex_from s i c with
    | Some j -> aux (j::acc) (j-1)
    | None -> (acc)
  in
  aux [] n

let char_split c s =
  let rec aux acc i =
    match char_rindex_from s i c with
    | Some j ->
        let sub = String.sub s (j+1) (i-j) in
        aux (sub::acc) (j-1)
    | None ->
        let sub = String.sub s 0 (i+1) in
        (sub::acc)
  in
  aux [] (String.length s - 1)

let char_splitter c s =
  let r = char_split c s in
  let r = List.map String.trim r in
  let r = List.filter ((<>) "") r in
  (r)

let char_cut c s =
  match char_index_from s 0 c with
  | Some j ->
      let left = String.sub s 0 j
      and right = String.sub s (j+1) (String.length s - j - 1) in
      Some (left, right)
  | None ->
      None

let char_rcut c s =
  match char_rindex_from s 0 c with
  | Some j ->
      let left = String.sub s 0 j
      and right = String.sub s (j+1) (String.length s - j - 1) in
      Some (left, right)
  | None ->
      None

let starts_with sub s =
  let n1 = String.length s
  and n2 = String.length sub in
  n2 <= n1 &&
    sub = (String.sub s 0 n2)

let ends_with sub s =
  let n1 = String.length s
  and n2 = String.length sub in
  n2 <= n1 &&
    sub = (String.sub s (n1 - n2) n2)

let sub_opt s ofs len =
  try Some (String.sub s ofs len)
  with Invalid_argument _ -> None

let sub_is s ofs len sub =
  match sub_opt s ofs len with
  | Some _sub -> _sub = sub
  | None -> false

let str_split s sep =
  let c0 = sep.[0] in
  let len = String.length sep in
  let rec aux acc i prev =
    match char_index_from s i c0 with
    | Some j ->
        if sub_is s j len sep
        then
          let sub = String.sub s prev (j-prev) in
          let ofs = (j+len(*+1?*)) in
          aux (sub::acc) ofs ofs
        else
          aux acc (j+1) prev
    | None ->
        let n = String.length s in
        let sub = String.sub s prev (n-prev) in
        List.rev (sub::acc)
  in
  aux [] 0 0

let str_cut s sep =
  let c0 = sep.[0] in
  let len = String.length sep in
  match char_index_from s 0 c0 with
  | Some j ->
      if sub_is s j len sep
      then
        let sub1 = String.sub s 0 j in
        let ofs = (j+len(*+1?*)) in
        let n = String.length s in
        let sub2 = String.sub s ofs (n-ofs) in
        Some(sub1, sub2)
      else
        None
  | None ->
      None

let last_ofs s =
  String.length s - 1

let valid_ofs s ofs =
  ofs >= 0 && ofs < String.length s

let string_index_from s i pat =
  let c = pat.[0] in
  let n = String.length pat in
  let rec aux i =
    match char_index_from s i c with
    | None -> None
    | Some j ->
        if sub_is s j n pat then Some j
        else aux (j+1)
  in
  aux i

let string_rindex_from s i pat =
  let c = pat.[0] in
  let n = String.length pat in
  let rec aux i =
    match char_rindex_from s i c with
    | None -> None
    | Some j ->
        if sub_is s j n pat then Some j
        else aux (j-1)
  in
  aux i

let string_index s pat =
  string_index_from s 0 pat

let string_rindex s pat =
  string_rindex_from s (String.length s - 1) pat

