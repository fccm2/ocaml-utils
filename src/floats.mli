(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module Float of the stdlib *)

type t = float

val compare : t -> t -> int
val rand : float -> float

val abs : float -> float
val cmp_float : ?epsilon_float:float -> unit -> float -> float -> bool

val ( **. ) : float -> float -> float

module Infix : sig
  val ( + ) : float -> float -> float
  val ( - ) : float -> float -> float
  val ( * ) : float -> float -> float
  val ( / ) : float -> float -> float
  val ( % ) : float -> float -> float
  val ( < ) : float -> float -> bool
  val ( > ) : float -> float -> bool
  val ( = ) : float -> float -> bool
  val ( <= ) : float -> float -> bool
  val ( >= ) : float -> float -> bool
  val ( ** ) : float -> float -> float
end

module InfixDot : sig
  val ( +. ) : float -> float -> float
  val ( -. ) : float -> float -> float
  val ( *. ) : float -> float -> float
  val ( /. ) : float -> float -> float
  val ( %. ) : float -> float -> float
  val ( <. ) : float -> float -> bool
  val ( >. ) : float -> float -> bool
  val ( =. ) : float -> float -> bool
  val ( <=. ) : float -> float -> bool
  val ( >=. ) : float -> float -> bool
  val ( **. ) : float -> float -> float
end

