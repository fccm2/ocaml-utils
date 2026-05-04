type t = int64

module Infix = struct

  external ( + ) : int64 -> int64 -> int64 = "%int64_add"
  external ( - ) : int64 -> int64 -> int64 = "%int64_sub"
  external ( * ) : int64 -> int64 -> int64 = "%int64_mul"
  external ( / ) : int64 -> int64 -> int64 = "%int64_div"

  external ( << ) : int64 -> int -> int64 = "%int64_lsl"
  external ( >> ) : int64 -> int -> int64 = "%int64_asr"

end
open Infix

let range a b =
  a + Random.int64 (b - a + 1L)

