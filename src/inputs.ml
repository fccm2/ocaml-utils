(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Additional functions to the stdlib *)

type t = in_channel

let read_file filename =
  let ic = open_in filename in
  let len = in_channel_length ic in
  let buf = Strings.create len in
  really_input ic (Obj.magic buf) 0 len;
  close_in ic;
  (buf)

let read_file_bin filename =
  let ic = open_in_bin filename in
  let len = in_channel_length ic in
  let buf = Strings.create len in
  really_input ic (Obj.magic buf) 0 len;
  close_in ic;
  (buf)

let input_line ic =
  try Some (input_line ic)
  with End_of_file -> None

let input_lines ic =
  let rec aux acc =
    match input_line ic with
    | Some line -> aux (line::acc)
    | None -> (List.rev acc)
  in
  aux []

let lines_of_file filename =
  let ic = open_in filename in
  let lines = input_lines ic in
  close_in ic;
  (lines)

(*
File: "inputs.ml", line 56, 
56 |     let bytes = input ic tmp 0 4096 in
                              ^^^
Error: This expression has type string but an expression was expected of type bytes
*)
(*
  val input : in_channel -> bytes -> int -> int -> int
  (** [input ic buf pos len] *)
*)
let input_channel ic =
  let buf = Buffer.create 16384
  and tmp = Strings.create 4096 in
  let rec aux () =
    let bytes = input ic (Obj.magic tmp) 0 4096 in
    if bytes > 0 then begin
      Buffer.add_substring buf tmp 0 bytes;
      aux ()
    end
  in
  begin try aux () with End_of_file -> () end;
  (Buffer.contents buf)

let line = input_line ;;
let lines = input_lines ;;

