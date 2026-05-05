(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the stdlib *)

module Lists = struct
  (*
  include List
  *)
  include Lists
end

module Arrays = struct
  (*
  include Array
  *)
  include Arrays
end

module Strings = struct
  (*
  include String
  *)
  include Strings
end

module ImArrays = struct
  (*
  include Array
  *)
  include ImArrays
end

module ImStrings = struct
  (*
  include String
  *)
  include ImStrings
end

module Chars = struct
  (*
  include Char
  *)
  include Chars
end

module Inputs = struct
  include Inputs
end

module Outputs = struct
  include Outputs
end

module Loops = struct
  include Loops
end

module Chars2 = struct
  include Chars2
end

module Labels = struct
  module Loops = struct
    include LoopsLbl
  end
  module Pervasive = struct
    include Pervasive.Labels
  end
end

module Sys = struct
  (*
  include Sys
  *)
  let args = List.tl (Array.to_list Sys.argv)
end


module RandState = struct
 
let make_init_bak () =
  let st = Random.State.make_self_init () in
  let seed = Array.init 24 (fun _ -> Random.State.int st 1000) in
  let st = Random.State.make seed in
  let bak =
    String.concat ":" (Array.to_list (Array.map string_of_int seed))
  in
  (st, bak)

let make_bak_init bak =
  let seed = Strings.char_split ':' bak in
  let seed = List.map int_of_string seed in
  Random.State.make (Array.of_list seed)

end


module Randoms = struct
  (*
  include Random
  *)
  include Randoms
end

module Ints = struct
  include Ints
end

module Floats = struct
  include Floats
end

module Ints32 = struct
  (*
  include Int32
  *)
  include Ints32
end

module Ints64 = struct
  (*
  include Int64
  *)
  include Ints64
end

module Options = struct
  include Options
end

module Args = struct
  include Args
end

