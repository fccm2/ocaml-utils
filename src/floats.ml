(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

type t = float
let compare (a : t) b = compare a b

let rand v = Random.float v

(*
external ( **. ) : float -> float -> float = "caml_power_float" "pow" "float"
*)
let ( **. ) = Float.pow

(*
external abs : float -> float = "%absfloat"
*)
let abs = Float.abs

let cmp_float ?(epsilon_float = epsilon_float) () =
  fun a b ->
    (abs_float (a -. b)) <= epsilon_float

module Infix = struct

external ( + ) : float -> float -> float = "%addfloat"
external ( - ) : float -> float -> float = "%subfloat"
external ( * ) : float -> float -> float = "%mulfloat"
external ( / ) : float -> float -> float = "%divfloat"
(*
external ( % ) : float -> float -> float = "caml_fmod_float" "fmod" "float"
*)
let ( % ) = mod_float

(*
external ( ** ) : float -> float -> float = "caml_power_float" "pow" "float"
*)
let ( ** ) = Float.pow

let ( < ) (a : float) b = a < b
let ( > ) (a : float) b = a > b
let ( = ) (a : float) b = a = b
let ( <= ) (a : float) b = a <= b
let ( >= ) (a : float) b = a >= b

end

module InfixDot = struct

external ( +. ) : float -> float -> float = "%addfloat"
external ( -. ) : float -> float -> float = "%subfloat"
external ( *. ) : float -> float -> float = "%mulfloat"
external ( /. ) : float -> float -> float = "%divfloat"
(*
external ( %. ) : float -> float -> float = "caml_fmod_float" "fmod" "float"
*)
let ( %. ) = mod_float

(*
external ( **. ) : float -> float -> float = "caml_power_float" "pow" "float"
*)
let ( **. ) = Float.pow

let ( <. ) (a : float) b = a < b
let ( >. ) (a : float) b = a > b
let ( =. ) (a : float) b = a = b
let ( <=. ) (a : float) b = a <= b
let ( >=. ) (a : float) b = a >= b

end

