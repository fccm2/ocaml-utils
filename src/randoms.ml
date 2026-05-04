(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

let init_bak () =
  Random.self_init ();
  let seed = Array.init 24 (fun _ -> Random.int 1000) in
  Random.full_init seed;
  (String.concat ":" (Array.to_list (Array.map string_of_int seed)))

let bak_init bak =
  let seed = Strings.char_split ':' bak in
  let seed = List.map int_of_string seed in
  Random.full_init (Array.of_list seed)


(* Probabilistic Choice *)

let prob_total prob lst =
  List.fold_left (fun acc x -> acc +. (prob x)) 0.0 lst

let prob_take prob lst =
  let tot = prob_total prob lst in
  let rec aux k = function
  | x::xs ->
      if k < (prob x)
      then (x)
      else aux (k -. (prob x)) xs
  | _ -> invalid_arg "rand_take"
  in
  aux (Random.float tot) lst

let prob_extract prob lst =
  let tot = prob_total prob lst in
  let rec aux acc k = function
  | x::xs ->
      if k < (prob x)
      then (x, List.rev_append acc xs)
      else aux (x::acc) (k -. (prob x)) xs
  | _ -> invalid_arg "rand_take"
  in
  aux [] (Random.float tot) lst


module Int = struct
  let range a b =
    a + Random.int (b - a + 1)
end

module Float = struct
  let range a b =
    a +. Random.float (b -. a)
end

module Int32 = struct
  external ( + ) : int32 -> int32 -> int32 = "%int32_add"
  external ( - ) : int32 -> int32 -> int32 = "%int32_sub"
  let range a b =
    a + Random.int32 (b - a + 1l)
end

module Int64 = struct
  external ( + ) : int64 -> int64 -> int64 = "%int64_add"
  external ( - ) : int64 -> int64 -> int64 = "%int64_sub"
  let range a b =
    a + Random.int64 (b - a + 1L)
end



module List = struct
  let take lst =
    let n = List.length lst in
    List.nth lst (Random.int n)
end

module Array = struct
  let take arr =
    let n = Array.length arr in
    arr.(Random.int n)
end

