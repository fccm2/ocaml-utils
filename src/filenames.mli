(* Copyright (C) 2026 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(** Additional functions to the module Filename of the stdlib *)

val get_extension : string -> string
(** return the extension of the filename.
    if the string doesn't contain any occurence of the character '.'
    then the function returns an empty string *)

