
exception Failed_with of string * string
(** the first parameter should be the function name,
    and the second one an explanation *)

let failhere func_name explanation =
  raise (Failed_with (func_name, explanation))

module Labels = struct
  let failhere ~func_name ~explanation =
    raise (Failed_with (func_name, explanation))
end
