
let get_extension s =
  try
    let p = String.rindex s '.' in
    (String.sub s p (String.length s - p))
  with Not_found -> ""

