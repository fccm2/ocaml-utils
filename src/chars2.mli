(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Use the second byte of a char, for utf8 *)

type t
val of_char : char -> t
val of_u2 : string -> t
(** [Chars2.of_u2 "\195\169"], will produce a chars2.t equivalent than [&eacute;] *)

val to_u2 : t -> string

(**
{[
# escaped ; = "\195\169" (* &eacute; *)
# escaped ; = "\195\160" (* &agrave; *)
# escaped ; = "\195\168" (* &egrave; *)
# escaped ; = "\195\170" (* &ecirc; *)
# escaped ; = "\195\162" (* &acirc; *)
# escaped ; = "\195\180" (* &ocric; *)
# escaped ; = "\195\167" (* &ccedil; *)
# escaped ; = "\195\174" (* &icirc; *)
# escaped ; = "\195\185" (* &ugrave; *)
# escaped ; = "\195\171" (* &euml; *)
# escaped ; = "\195\187" (* &ugrave; *)
# escaped ; = "\195\164" (* &auml; *)
# escaped ; = "\195\188" (* &uuml; *)
# escaped ; = "\195\182" (* &ouml; *)
# escaped ; = "\195\175" (* &iuml; *)
]}
*)
