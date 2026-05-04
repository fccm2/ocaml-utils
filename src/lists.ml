(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the module List of the stdlib *)

(* similar to [Array.init] *)
let init n f =
  if n < 0 then invalid_arg "List.init" else
  let rec aux acc i =
    if i >= n then (List.rev acc)
    else aux ((f i)::acc) (succ i)
  in
  aux [] 0

(* similar to List.find but returns
   the result of the function application *)
let return f lst =
  let rec aux = function
  | [] -> raise Not_found
  | x::xs ->
      match f x with
      | Some v -> v
      | None -> aux xs
  in
  aux lst

(* same than List.return but exceptionless *)
let return_opt f lst =
  let rec aux = function
  | [] -> None
  | x::xs ->
      match f x with
      | Some v -> Some v
      | None -> aux xs
  in
  aux lst

(* List.filter and List.map in one round *)
let map_opt f lst =
  let rec aux acc = function
  | [] -> (List.rev acc)
  | x::xs ->
      match f x with
      | Some v -> aux (v::acc) xs
      | None -> aux acc xs
  in
  aux [] lst

let take n lst =
  let rec aux acc i lst =
    if i >= n then (List.rev acc) else
    match lst with
    | x::xs -> aux (x::acc) (succ i) xs
    | [] -> failwith "take"
  in
  aux [] 0 lst

let drop n lst =
  let rec aux i lst =
    if i >= n then lst else
    match lst with
    | _::xs -> aux (succ i) xs
    | [] -> failwith "drop"
  in
  aux 0 lst

let uniq lst =
  let rec aux acc = function
  | [] -> (List.rev acc)
  | x::xs ->
      if List.mem x acc
      then aux acc xs
      else aux (x::acc) xs
  in
  aux [] lst

let index v lst =
  let rec aux i acc = function
  | [] -> (List.rev acc)
  | x::xs ->
      if x = v
      then aux (i+1) (i::acc) xs
      else aux (i+1) acc xs
  in
  aux 0 [] lst

let starts_with sub lst =
  let rec aux xs ys =
  match xs, ys with
  | x::xs, y::ys -> if x <> y then false else aux xs ys
  | [], _ -> true
  | _, [] -> false
  in
  aux sub lst


(* Association Lists *)

let assoc_err v lst ~err =
  let rec aux = function
  | [] -> failwith err
  | (x,y)::tl ->
      if x = v then y
      else aux tl
  in
  aux lst

let assoc_default v def lst =
  let rec aux = function
  | [] -> def
  | (x,y)::tl ->
      if x = v then y
      else aux tl
  in
  aux lst

let assoc_replace k v lst =
  let rec aux acc = function
  | [] -> failwith "assoc_replace"
  | ((x,_) as p)::tl ->
      if x = k then List.rev_append acc ((x,v) :: tl)
      else aux (p::acc) tl
  in
  aux [] lst

