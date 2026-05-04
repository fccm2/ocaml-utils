type t = int32

module Infix = struct

  external ( + ) : int32 -> int32 -> int32 = "%int32_add"
  external ( - ) : int32 -> int32 -> int32 = "%int32_sub"
  external ( * ) : int32 -> int32 -> int32 = "%int32_mul"
  external ( / ) : int32 -> int32 -> int32 = "%int32_div"

  external ( << ) : int64 -> int -> int64 = "%int32_lsl"
  external ( >> ) : int64 -> int -> int64 = "%int32_asr"

end
open Infix

let range a b =
  a + Random.int32 (b - a + 1l)

