(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)

(** Additional functions to the stdlib *)

module Lists : sig
  (** Additional functions to the [List] module *)

  val init : int -> (int -> 'a) -> 'a list
  (** [List.init n f] returns a list of [n] elements
      that were created by calling the function [f]
      with parameter from [0] to [n-1] *)

  val return : ('a -> 'b option) -> 'a list -> 'b
  (** similar to [List.find] but returns
      the result of the function application *)

  val return_opt : ('a -> 'b option) -> 'a list -> 'b option
  (** same than [List.return] but exceptionless *)

  val map_opt : ('a -> 'b option) -> 'a list -> 'b list
  (** List.map and List.filter in one round *)

  val assoc_err : 'a -> ('a * 'b) list -> err:string -> 'b
  (** same than List.assoc but
      with a custom error message *)

  val assoc_default : 'a -> 'b -> ('a * 'b) list -> 'b
  (** same than List.assoc but
      with a default value *)

  val assoc_replace : 'a -> 'b -> ('a * 'b) list -> ('a * 'b) list
  (** replace the associated value for the first key in an association list
      @raise Failure "assoc_replace" if the key doesn't exist *)

  val take : int -> 'a list -> 'a list
  (** takes the n-th first elements of the list

      @raise Exception: Failure "take",
        if there are less than [n] elements available
  *)

  val drop : int -> 'a list -> 'a list

  val uniq : 'a list -> 'a list

  val index : 'a -> 'a list -> int list

  val starts_with : 'a list -> 'a list -> bool

  (**/**)

  (** functions from the stdlib *)

  (*
  val length : 'a list -> int
  val hd : 'a list -> 'a
  val tl : 'a list -> 'a list
  val nth : 'a list -> int -> 'a
  val rev : 'a list -> 'a list
  val append : 'a list -> 'a list -> 'a list
  val rev_append : 'a list -> 'a list -> 'a list
  val concat : 'a list list -> 'a list
  val flatten : 'a list list -> 'a list
  val iter : ('a -> unit) -> 'a list -> unit
  val iteri : (int -> 'a -> unit) -> 'a list -> unit
  val map : ('a -> 'b) -> 'a list -> 'b list
  val mapi : (int -> 'a -> 'b) -> 'a list -> 'b list
  val rev_map : ('a -> 'b) -> 'a list -> 'b list
  val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b list -> 'a
  val fold_right : ('a -> 'b -> 'b) -> 'a list -> 'b -> 'b
  val iter2 : ('a -> 'b -> unit) -> 'a list -> 'b list -> unit
  val map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  val rev_map2 : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list
  val fold_left2 : ('a -> 'b -> 'c -> 'a) -> 'a -> 'b list -> 'c list -> 'a
  val fold_right2 :
    ('a -> 'b -> 'c -> 'c) -> 'a list -> 'b list -> 'c -> 'c
  val for_all : ('a -> bool) -> 'a list -> bool
  val exists : ('a -> bool) -> 'a list -> bool
  val for_all2 : ('a -> 'b -> bool) -> 'a list -> 'b list -> bool
  val exists2 : ('a -> 'b -> bool) -> 'a list -> 'b list -> bool
  val mem : 'a -> 'a list -> bool
  val memq : 'a -> 'a list -> bool
  val find : ('a -> bool) -> 'a list -> 'a
  val filter : ('a -> bool) -> 'a list -> 'a list
  val find_all : ('a -> bool) -> 'a list -> 'a list
  val partition : ('a -> bool) -> 'a list -> 'a list * 'a list
  val assoc : 'a -> ('a * 'b) list -> 'b
  val assq : 'a -> ('a * 'b) list -> 'b
  val mem_assoc : 'a -> ('a * 'b) list -> bool
  val mem_assq : 'a -> ('a * 'b) list -> bool
  val remove_assoc : 'a -> ('a * 'b) list -> ('a * 'b) list
  val remove_assq : 'a -> ('a * 'b) list -> ('a * 'b) list
  val split : ('a * 'b) list -> 'a list * 'b list
  val combine : 'a list -> 'b list -> ('a * 'b) list
  val sort : ('a -> 'a -> int) -> 'a list -> 'a list
  val stable_sort : ('a -> 'a -> int) -> 'a list -> 'a list
  val fast_sort : ('a -> 'a -> int) -> 'a list -> 'a list
  val merge : ('a -> 'a -> int) -> 'a list -> 'a list -> 'a list
  *)
end


module Arrays : sig
  (** Additional functions to the [Array] module *)

  val map2 : ('a -> 'b -> 'c) -> 'a array -> 'b array -> 'c array

  (**/**)

  (** functions from the stdlib *)

  (*
  external length : 'a array -> int = "%array_length"
  external get : 'a array -> int -> 'a = "%array_safe_get"
  external set : 'a array -> int -> 'a -> unit = "%array_safe_set"
  external make : int -> 'a -> 'a array = "caml_make_vect"
  external create : int -> 'a -> 'a array = "caml_make_vect"
  val init : int -> (int -> 'a) -> 'a array
  val make_matrix : int -> int -> 'a -> 'a array array
  val create_matrix : int -> int -> 'a -> 'a array array
  val append : 'a array -> 'a array -> 'a array
  val concat : 'a array list -> 'a array
  val sub : 'a array -> int -> int -> 'a array
  val copy : 'a array -> 'a array
  val fill : 'a array -> int -> int -> 'a -> unit
  val blit : 'a array -> int -> 'a array -> int -> int -> unit
  val to_list : 'a array -> 'a list
  val of_list : 'a list -> 'a array
  val iter : ('a -> unit) -> 'a array -> unit
  val map : ('a -> 'b) -> 'a array -> 'b array
  val iteri : (int -> 'a -> unit) -> 'a array -> unit
  val mapi : (int -> 'a -> 'b) -> 'a array -> 'b array
  val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b array -> 'a
  val fold_right : ('b -> 'a -> 'a) -> 'b array -> 'a -> 'a
  val sort : ('a -> 'a -> int) -> 'a array -> unit
  val stable_sort : ('a -> 'a -> int) -> 'a array -> unit
  val fast_sort : ('a -> 'a -> int) -> 'a array -> unit
  external unsafe_get : 'a array -> int -> 'a = "%array_unsafe_get"
  external unsafe_set : 'a array -> int -> 'a -> unit = "%array_unsafe_set"

  (**/**)

  external unsafe_blit :
    'a array -> int -> 'a array -> int -> int -> unit
     = "caml_array_blit"
  (** function from the stdlib but that is not exported
      in the std interface *)
  *)
end


module ImArrays : sig
  (** Modified [Array] module for immutable arrays *)

  type 'a t

  val map2 : ('a -> 'b -> 'c) -> 'a t -> 'b t -> 'c t

  (**/**)

  (** functions from the stdlib *)

  (*
  external length : 'a t -> int = "%array_length"
  external get : 'a t -> int -> 'a = "%array_safe_get"
  external make : int -> 'a -> 'a t = "caml_make_vect"
  external create : int -> 'a -> 'a t = "caml_make_vect"
  val init : int -> (int -> 'a) -> 'a t
  val make_matrix : int -> int -> 'a -> 'a t t
  val create_matrix : int -> int -> 'a -> 'a t t
  val append : 'a t -> 'a t -> 'a t
  val concat : 'a t list -> 'a t
  val sub : 'a t -> int -> int -> 'a t
  val copy : 'a t -> 'a t
  val to_list : 'a t -> 'a list
  val of_list : 'a list -> 'a t
  val iter : ('a -> unit) -> 'a t -> unit
  val map : ('a -> 'b) -> 'a t -> 'b t
  val iteri : (int -> 'a -> unit) -> 'a t -> unit
  val mapi : (int -> 'a -> 'b) -> 'a t -> 'b t
  val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b t -> 'a
  val fold_right : ('b -> 'a -> 'a) -> 'b t -> 'a -> 'a
  val sort : ('a -> 'a -> int) -> 'a t -> 'a t
  val stable_sort : ('a -> 'a -> int) -> 'a t -> 'a t
  val fast_sort : ('a -> 'a -> int) -> 'a t -> 'a t
  external unsafe_get : 'a t -> int -> 'a = "%array_unsafe_get"
  *)

end


module Strings : sig
  (** Additional functions to the [String] module *)

  val init : int -> (int -> char) -> string

  val fold_left : ('a -> char -> 'a) -> 'a -> string -> 'a

  val nth : string -> int -> char option
  (** get the nth char of a string in an exceptionless way *)

  val nth_is : string -> int -> char -> bool
  (** [String.nth_is s ofs c] returns true if the nth char is [c] *)

  val char_rindex_from : string -> int -> char -> int option

  val char_index_from : string -> int -> char -> int option

  val char_index_all : string -> char -> int list

  val char_split : char -> string -> string list
  (** [char_split s c] splits the string [s] wherever the character
      [c] appears *)

  val char_splitter : char -> string -> string list
  (** same than [char_split] but also [String.trim]s all strings
      and filters out all empty strings *)

  val char_cut : char -> string -> (string * string) option
  (** cut the string at the first occurence of the char *)

  val char_rcut : char -> string -> (string * string) option
  (** cut the string at the last occurence of the char *)

  val starts_with : string -> string -> bool
  (** [starts_with sub s] returns true if [s] starts with [sub] *)

  val ends_with : string -> string -> bool
  (** [ends_with sub s] returns true if [s] ends with [sub] *)

  val str_split : string -> string -> string list
  val str_cut : string -> string -> (string * string) option

  val string_index : string -> string -> int option
  val string_rindex : string -> string -> int option

  val string_index_from : string -> int -> string -> int option
  val string_rindex_from : string -> int -> string -> int option

  (**/**)

  (** functions from the stdlib *)

  (*
  external length : string -> int = "%string_length"
  external get : string -> int -> char = "%string_safe_get"
  val create : int -> string
  val make : int -> char -> string
  val copy : string -> string
  val sub : string -> int -> int -> string
  (*
  val fill : string -> int -> int -> char -> unit
  val blit : string -> int -> string -> int -> int -> unit
  *)
  val concat : string -> string list -> string
  val iter : (char -> unit) -> string -> unit
  val iteri : (int -> char -> unit) -> string -> unit
  val map : (char -> char) -> string -> string
  val trim : string -> string
  val escaped : string -> string
  val index : string -> char -> int
  val rindex : string -> char -> int
  val index_from : string -> int -> char -> int
  val rindex_from : string -> int -> char -> int
  val contains : string -> char -> bool
  val contains_from : string -> int -> char -> bool
  val rcontains_from : string -> int -> char -> bool
  val uppercase : string -> string
  val lowercase : string -> string
  val capitalize : string -> string
  val uncapitalize : string -> string
  type t = string
  val compare : t -> t -> int
  external unsafe_get : string -> int -> char = "%string_unsafe_get"
  (*
  external unsafe_set : string -> int -> char -> unit = "%string_unsafe_set"
  external unsafe_blit : string -> int -> string -> int -> int -> unit
    = "caml_blit_string" "noalloc"
  external unsafe_fill : string -> int -> int -> char -> unit
    = "caml_fill_string" "noalloc"
  *)
  *)

end


module ImStrings : sig
  (** Modified [String] module for immutable strings *)

  type t

  val to_string : t -> string
  val of_string : string -> t

  val init : int -> (int -> char) -> t

  val fold_left : ('a -> char -> 'a) -> 'a -> t -> 'a

  val nth : t -> int -> char option
  (** get the nth char of a string in an exceptionless way *)

  val nth_is : t -> int -> char -> bool
  (** [String.nth_is s ofs c] returns true if the nth char is [c] *)

  val char_rindex_from : t -> int -> char -> int option

  val char_index_from : t -> int -> char -> int option

  val char_index_all : t -> char -> int list

  val char_split : char -> t -> t list
  (** [char_split s c] splits the string [s] wherever the character
      [c] appears *)

  val char_splitter : char -> t -> t list
  (** same than [char_split] but also [String.trim]s all strings
      and filters out all empty strings *)

  val char_cut : char -> t -> (t * t) option
  (** cut the string at the first occurence of the char *)

  val char_rcut : char -> t -> (t * t) option
  (** cut the string at the last occurence of the char *)

  val starts_with : t -> t -> bool
  (** [starts_with sub s] returns true if [s] starts with [sub] *)

  val ends_with : t -> t -> bool
  (** [ends_with sub s] returns true if [s] ends with [sub] *)

  val str_split : t -> t -> t list
  val str_cut : t -> t -> (t * t) option

  val string_index : t -> t -> int option
  val string_rindex : t -> t -> int option

  val string_index_from : t -> int -> t -> int option
  val string_rindex_from : t -> int -> t -> int option

  (**/**)

  (** functions from the stdlib *)

  (*
  external length : t -> int = "%string_length"
  external get : t -> int -> char = "%string_safe_get"
  val make : int -> char -> t
  val copy : t -> t
  val sub : t -> int -> int -> t
  (*
  val blit : t -> int -> string -> int -> int -> unit
  *)
  val concat : t -> t list -> t
  val iter : (char -> unit) -> t -> unit
  val iteri : (int -> char -> unit) -> t -> unit
  val map : (char -> char) -> t -> t
  val trim : t -> t
  val escaped : t -> t
  val index : t -> char -> int
  val rindex : t -> char -> int
  val index_from : t -> int -> char -> int
  val rindex_from : t -> int -> char -> int
  val contains : t -> char -> bool
  val contains_from : t -> int -> char -> bool
  val rcontains_from : t -> int -> char -> bool
  val uppercase : t -> t
  val lowercase : t -> t
  val capitalize : t -> t
  val uncapitalize : t -> t
  val compare : t -> t -> int
  external unsafe_get : t -> int -> char = "%string_unsafe_get"
  (*
  external unsafe_blit : t -> int -> string -> int -> int -> unit
    = "caml_blit_string" "noalloc"
  *)
  *)

end


module Chars : sig
  (** Additional functions to the [Char] module of the stdlib *)

  val is_alpha : char -> bool
  val is_num : char -> bool
  val is_alpha_num : char -> bool
  val is_hex_num : char -> bool

  (**/**)

  (** functions from the stdlib *)

  (*
  external code : char -> int = "%identity"
  val chr : int -> char
  val escaped : char -> string
  val lowercase : char -> char
  (*
    File "utilsLib.mli", line 395, characters 2-30:
    Expected signature
  *)
  val uppercase : char -> char
  type t = char
  val compare : t -> t -> int
  external unsafe_chr : int -> char = "%identity"
  *)
end


module Inputs : sig
  type t = in_channel

  val read_file : string -> string
  (** loads the all content of the given file *)

  val read_file_bin : string -> string
  (** read binary file in a portable way for Windows *)

  val input_channel : t -> string
  (** get all contents from an input channel *)

  val input_line : t -> string option
  (** returns one line from the input channel
      or [None] if the end of file is reached *)

  val input_lines : t -> string list
  (** returns the list of lines from an input channel *)

  val lines_of_file : string -> string list
  (** returns the list of lines from a file *)

  val line : t -> string option
  (** same than [input_line] *)

  val lines : t -> string list
  (** same than [input_lines] *)
end


module Outputs : sig
  type t = out_channel

  val write_file : string -> string -> unit
  (** [write_file filename contents] *)

  val write_file_bin : string -> string -> unit

  module Infix : sig
    val ( << ) : out_channel -> string -> unit
  end
end


module Sys : sig

  val args : string list
  (** same than [Sys.argv] but as a list *)

  (**/**)

  (** functions from the stdlib *)

  (*
  val argv : string array
  val executable_name : string
  external file_exists : string -> bool = "caml_sys_file_exists"
  external is_directory : string -> bool = "caml_sys_is_directory"
  external remove : string -> unit = "caml_sys_remove"
  external rename : string -> string -> unit = "caml_sys_rename"
  external getenv : string -> string = "caml_sys_getenv"
  external command : string -> int = "caml_sys_system_command"
  (*
  external time : unit -> float = "caml_sys_time"
  *)
  external chdir : string -> unit = "caml_sys_chdir"
  external getcwd : unit -> string = "caml_sys_getcwd"
  external readdir : string -> string array = "caml_sys_read_directory"
  val interactive : bool ref
  val os_type : string
  val word_size : int
  val big_endian : bool
  val max_string_length : int
  val max_array_length : int
  type signal_behavior =
    Sys.signal_behavior =
      Signal_default
    | Signal_ignore
    | Signal_handle of (int -> unit)
  external signal : int -> signal_behavior -> signal_behavior
    = "caml_install_signal_handler"
  val set_signal : int -> signal_behavior -> unit
  val sigabrt : int
  val sigalrm : int
  val sigfpe : int
  val sighup : int
  val sigill : int
  val sigint : int
  val sigkill : int
  val sigpipe : int
  val sigquit : int
  val sigsegv : int
  val sigterm : int
  val sigusr1 : int
  val sigusr2 : int
  val sigchld : int
  val sigcont : int
  val sigstop : int
  val sigtstp : int
  val sigttin : int
  val sigttou : int
  val sigvtalrm : int
  val sigprof : int
  exception Break
  val catch_break : bool -> unit
  val ocaml_version : string
  *)
end


module Loops : sig

  val fold_left : ('a -> int -> 'a) -> 'a -> int -> 'a
  (** [Loop.fold_left f v n] calls [f] in a folded way over
      the [v] parameter [n] times. *)

  val iter : (unit -> unit) -> int -> unit
  (** [Loop.iter f n] calls [f] repeatedly [n] times. *)

  val iteri : (int -> unit) -> int -> unit
  (** [Loop.iteri f n] calls [f] repeatedly [n] times. *)
end


module Randoms : sig

  val init_bak : unit -> string
  (** make possible to init with the same seed again *)

  val bak_init : string -> unit
  (** init using a backup seed *)

  val prob_take : ('a -> float) -> 'a list -> 'a
  (** probabilistic choice *)

  val prob_extract : ('a -> float) -> 'a list -> 'a * 'a list
  (** extract one element from the list and also return the list
      without this element *)

  (**/**)

  (** functions from the stdlib *)

  (*
  val init : int -> unit
  val full_init : int array -> unit
  val self_init : unit -> unit
  val bits : unit -> int
  val int : int -> int
  val int32 : Int32.t -> Int32.t
  val nativeint : Nativeint.t -> Nativeint.t
  val int64 : Int64.t -> Int64.t
  val float : float -> float
  val bool : unit -> bool
  module State :
    sig
      type t = Random.State.t
      val make : int array -> t
      val make_self_init : unit -> t
      val copy : t -> t
      val bits : t -> int
      val int : t -> int -> int
      val int32 : t -> Int32.t -> Int32.t
      val nativeint : t -> Nativeint.t -> Nativeint.t
      val int64 : t -> Int64.t -> Int64.t
      val float : t -> float -> float
      val bool : t -> bool
    end
  val get_state : unit -> State.t
  val set_state : State.t -> unit
  *)

  (**/**)

  module Int : sig
    val range : int -> int -> int
  end

  module Float : sig
    val range : float -> float -> float
  end

  module Int32 : sig
    val range : int32 -> int32 -> int32
  end

  module Int64 : sig
    val range : int64 -> int64 -> int64
  end

  module List : sig
    val take : 'a list -> 'a
  end

  module Array : sig
    val take : 'a array -> 'a
  end
end


module RandState : sig
  val make_init_bak : unit -> Random.State.t * string
  (** make possible to init with the same seed again *)

  val make_bak_init : string -> Random.State.t
  (** init using a backup seed *)
end


module Ints : sig
  type t = int
  val compare : t -> t -> int

  val rand : t -> t

(*
  module Infix : sig
    external ( + ) : int -> int -> int = "%addint"
    external ( - ) : int -> int -> int = "%subint"
    external ( * ) : int -> int -> int = "%mulint"
    external ( / ) : int -> int -> int = "%divint"

    external ( % ) : int -> int -> int = "%modint"

    external ( << ) : int -> int -> int = "%lslint"
    external ( >> ) : int -> int -> int = "%lsrint"
  end
*)

  (**/**)

  (** functions from the stdlib *)
end


module Floats : sig
  type t = float
  val compare : t -> t -> int

  val rand : t -> t

  val cmp_float : ?epsilon_float:float -> unit ->
    float -> float -> bool
  (** if the difference is less or equal to [epsilon_float] *)

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

  (**/**)

  (** functions from the stdlib *)
end


module Ints32 : sig
  type t = int32
  val range : t -> t -> t

  module Infix : sig
    val ( + ) : int32 -> int32 -> int32
    val ( - ) : int32 -> int32 -> int32
    val ( * ) : int32 -> int32 -> int32
    val ( / ) : int32 -> int32 -> int32

    val ( << ) : int64 -> int -> int64
    val ( >> ) : int64 -> int -> int64
  end

  (**/**)

  (** functions from the stdlib *)

  (*
  val zero : int32
  val one : int32
  val minus_one : int32
  external neg : int32 -> int32 = "%int32_neg"
  external add : int32 -> int32 -> int32 = "%int32_add"
  external sub : int32 -> int32 -> int32 = "%int32_sub"
  external mul : int32 -> int32 -> int32 = "%int32_mul"
  external div : int32 -> int32 -> int32 = "%int32_div"
  external rem : int32 -> int32 -> int32 = "%int32_mod"
  val succ : int32 -> int32
  val pred : int32 -> int32
  val abs : int32 -> int32
  val max_int : int32
  val min_int : int32
  external logand : int32 -> int32 -> int32 = "%int32_and"
  external logor : int32 -> int32 -> int32 = "%int32_or"
  external logxor : int32 -> int32 -> int32 = "%int32_xor"
  val lognot : int32 -> int32
  external shift_left : int32 -> int -> int32 = "%int32_lsl"
  external shift_right : int32 -> int -> int32 = "%int32_asr"
  external shift_right_logical : int32 -> int -> int32 = "%int32_lsr"
  external of_int : int -> int32 = "%int32_of_int"
  external to_int : int32 -> int = "%int32_to_int"
  (*
  external of_float : float -> int32 = "caml_int32_of_float"
  external to_float : int32 -> float = "caml_int32_to_float"
  *)
  external of_string : string -> int32 = "caml_int32_of_string"
  val to_string : int32 -> string
  (*
  external bits_of_float : float -> int32 = "caml_int32_bits_of_float"
  external float_of_bits : int32 -> float = "caml_int32_float_of_bits"
  *)
  val compare: t -> t -> int
  *)
end


module Ints64 : sig
  type t = int64
  val range : t -> t -> t

  module Infix : sig
    val ( + ) : int64 -> int64 -> int64
    val ( - ) : int64 -> int64 -> int64
    val ( * ) : int64 -> int64 -> int64
    val ( / ) : int64 -> int64 -> int64

    val ( << ) : int64 -> int -> int64
    val ( >> ) : int64 -> int -> int64
  end

  (**/**)

  (** functions from the stdlib *)

  (*
  val zero : int64
  val one : int64
  val minus_one : int64
  external neg : int64 -> int64 = "%int64_neg"
  external add : int64 -> int64 -> int64 = "%int64_add"
  external sub : int64 -> int64 -> int64 = "%int64_sub"
  external mul : int64 -> int64 -> int64 = "%int64_mul"
  external div : int64 -> int64 -> int64 = "%int64_div"
  external rem : int64 -> int64 -> int64 = "%int64_mod"
  val succ : int64 -> int64
  val pred : int64 -> int64
  val abs : int64 -> int64
  val max_int : int64
  val min_int : int64
  external logand : int64 -> int64 -> int64 = "%int64_and"
  external logor : int64 -> int64 -> int64 = "%int64_or"
  external logxor : int64 -> int64 -> int64 = "%int64_xor"
  val lognot : int64 -> int64
  external shift_left : int64 -> int -> int64 = "%int64_lsl"
  external shift_right : int64 -> int -> int64 = "%int64_asr"
  external shift_right_logical : int64 -> int -> int64 = "%int64_lsr"
  external of_int : int -> int64 = "%int64_of_int"
  external to_int : int64 -> int = "%int64_to_int"
  (*
  external of_float : float -> int64 = "caml_int64_of_float"
  external to_float : int64 -> float = "caml_int64_to_float"
  *)
  external of_int32 : int32 -> int64 = "%int64_of_int32"
  external to_int32 : int64 -> int32 = "%int64_to_int32"
  external of_nativeint : nativeint -> int64 = "%int64_of_nativeint"
  external to_nativeint : int64 -> nativeint = "%int64_to_nativeint"
  external of_string : string -> int64 = "caml_int64_of_string"
  val to_string : int64 -> string
  (*
  external bits_of_float : float -> int64 = "caml_int64_bits_of_float"
  external float_of_bits : int64 -> float = "caml_int64_float_of_bits"
  *)
  val compare: t -> t -> int
  *)
end


module Args : sig
(** Parsing command line arguments in a functional way. *)

  (** for non-[Acc] kinds if an argument is given several times on the
      command line the last one overwrites the previous ones *)
  type kind =
    | Int
    | Float
    | String
    | Set_true  (** [get_bool] will return [true] for this arg *)
    | Set_false  (** [get_bool] will return [false] for this arg *)
    | Custom of string 
      (** the string after this constructor gives
          clue to the user about the expected type *)
    | StringAcc
      (** This command will accumulate the parameters when
          several ones are provided on the command line. *)

  type p =
    | Default of string
    | Defaults of string list
    | Required
    | Optional

  type spec = string * p * kind * string
  (** [(command_line_argument, about_value, kind, help_msg)] *)

  type args = string list
  (** typically [Sys.args] *)

  type cmd

  val parse : spec list -> args -> cmd

  val usage : spec list -> unit

  (** {5 Accessors} *)

  (** The string should be the same than the first element of
      the [spec] entry *)

  val get_int : cmd -> string -> int
  val get_float : cmd -> string -> float
  val get_bool : cmd -> string -> bool
  val get_string : cmd -> string -> string

  val get_custom : (string -> 'a) -> cmd -> string -> 'a

  val get_string_list : cmd -> string -> string list

  (** Option *)

  val get_int_opt : cmd -> string -> int option
  val get_float_opt : cmd -> string -> float option
  val get_bool_opt : cmd -> string -> bool option
  val get_string_opt : cmd -> string -> string option

  val get_custom_opt : (string -> 'a) -> cmd -> string -> 'a option
end


module Options : sig
  val default : 'a -> 'a option -> 'a
  (** [Option.default def opt_val] returns [def] if [opt_val] is [None]
      or if [opt_val] is [Some v], then [v] is returned. *)
end

module Chars2 : sig
  type t
  val of_char : char -> t
  val of_u2 : string -> t
  val to_u2 : t -> string
end

module Labels : sig
  module Loops : sig
    val fold_left : f:('a -> int -> 'a) -> init:'a -> int -> 'a
    val iter : f:(unit -> 'a) -> int -> unit
    val iteri : f:(int -> 'a) -> int -> unit
  end
  module Pervasive : sig
    val failhere : func_name:string -> explanation:string -> 'a
  end
end

