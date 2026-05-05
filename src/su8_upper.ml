let len = String.length ;;
let s_get = String.get ;;
let rev = List.rev ;;
let lst_len = List.length ;;
let to_int = int_of_char ;;
let s_ini = String.init ;;

let chars_of_string s =
  let n = len s in
  let rec aux i acc =
    if i >= n then (rev acc) else
    let c = s_get s i in
    aux (succ i) (c::acc)
  in
  aux 0 []

let make = String.make ;;
let rev_map = List.rev_map ;;

let concat = String.concat ;;

let cs_of_s = chars_of_string ;;

let s_of_cs cs =
  let cs = rev cs in
  let scs = rev_map (fun c -> make 1 c) cs in
  (concat "" scs)

let string_of_chars = s_of_cs ;;

let fld_lft = List.fold_left ;;
let pop n lst =
  let rec aux n lst =
    if n <= 0 then lst else
    match lst with
    | _::lst -> aux (n-1) lst
    | [] -> lst
  in
  aux n lst

let u8 s =
  let cs = cs_of_s s in
  let cs = rev cs in
  let cs = rev_map to_int cs in
  fld_lft (fun (prev, acc) c ->
    match prev, c with
    | Some 0xc3, 0xb6 -> (None, 0x96::acc) (*o*) (* uml's *)
    | Some 0xc3, 0xa4 -> (None, 0x84::acc) (*a*)
    | Some 0xc3, 0xab -> (None, 0x8b::acc) (*e*)
    | Some 0xc3, 0xbc -> (None, 0x9c::acc) (*u*)
    | Some 0xc3, 0xaf -> (None, 0x8f::acc) (*i*)
    | Some 0xc3, 0xbf -> (None, 0xb8::0xc5::(pop 1 acc)) (*y*)
    | Some 0xc3, 0xa9 -> (None, 0x89::acc)  (* é *)  (* "éèêà" *)
    | Some 0xc3, 0xa8 -> (None, 0x88::acc)  (* è *)
    | Some 0xc3, 0xaa -> (None, 0x8a::acc)  (* ê *)
    | Some 0xc3, 0xa0 -> (None, 0x80::acc)  (* à *)

    | Some 0xc3, 0xa2 -> (None, 0x82::acc)  (* â *)
    | Some 0xc3, 0xb4 -> (None, 0x94::acc)  (* ô *)
    | Some 0xc3, 0xae -> (None, 0x8e::acc)  (* î *)
    | Some 0xc3, 0xbb -> (None, 0x9b::acc)  (* û *)
    | Some 0xc3, 0xb9 -> (None, 0x99::acc)  (* ù *)

    | Some 0xc3, 0xa7 -> (None, 0x87::acc)  (* ç *)

    | _, b -> (Some c, b::acc)
    (*
    *)
    (*
      c3 82 c3 94 c3 8e c3 9b c3 99
      Â  Ô  Î  Û  Ù
    *)
  ) (None, []) cs

let of_int = char_of_int ;;

let u8 s =
  let _, cs = u8 s in
  let cs = rev_map of_int cs in
  (s_of_cs cs)

let uppercase_utf8 = u8 ;;

