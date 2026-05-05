
(*

# ((Obj.magic 'a') : int) ;;
- : int = 97

# ((Obj.magic 98) : char) ;;
- : char = 'b'

*)

type t = char
let of_char a =
  let i = ((Obj.magic a) : int) in
  let c = ((Obj.magic i) : char) in
  (c)

let of_u2 u2 =
  let n = String.length u2 in
  if n <> 2 then failwith "of_u2:len<>2" else
  let c0 = String.get u2 0 in
  let c1 = String.get u2 1 in
  Printf.printf "c0:%d\n" (int_of_char c0);
  Printf.printf "c1:%d\n" (int_of_char c1);
;;

let to_u2 i2 =
  let c2 = int_of_char i2 in
  let i0 = ((c2 lsr 8) land 0xff) in
  let i1 = (c2 land 0xff) in
  let c0 = char_of_int i0 in
  let c1 = char_of_int i1 in
  if i0 = 0 then (String.make 1 c1) else
  (String.make 1 c0) ^
  (String.make 1 c1)

let of_u2 u2 =
  let n = String.length u2 in
  if n <> 2 then failwith "of_u2:len<>2" else
  let c0 = String.get u2 0 in
  let c1 = String.get u2 1 in
  let i0 = (int_of_char c0) in
  let i1 = (int_of_char c1) in
  let i = (i0 lsl 8) lor (i1) in
  let c = ((Obj.magic i) : char) in
  (c)
;;

(*

# escaped "é";; = "\195\169" (* eacute *)
# escaped "à";; = "\195\160" (* agrave *)
# escaped "è";; = "\195\168" (* egrave *)
# escaped "ê";; = "\195\170" (* ecirc *)
# escaped "â";; = "\195\162" (* acirc *)
# escaped "ô";; = "\195\180" (* ocric *)
# escaped "î";; = "\195\174" (* icirc *)
# escaped "ç";; = "\195\167" (* ccedil *)
# escaped "ù";; = "\195\185" (* ugrave *)
# escaped "ë";; = "\195\171" (* euml *)
# escaped "û";; = "\195\187" (* ucirc *)
# escaped "ä";; = "\195\164" (* auml *)
# escaped "ü";; = "\195\188" (* uuml *)
# escaped "ö";; = "\195\182" (* ouml *)
# escaped "ï";; = "\195\175" (* iuml *)

*)

