(* Copyright (C) 2013 Florent Monnier
 
 This software is provided "AS-IS", without any express or implied warranty.
 In no event will the authors be held liable for any damages arising from
 the use of this software.
 
 Permission is granted to anyone to use this software for any purpose,
 including commercial applications, and to alter it and redistribute it freely.
*)
(* Parsing command line arguments in a functional way. *)

(* Read Command-Line Parameters *)

open Pervasive

(* Types *)

type kind = 
  | Int
  | Float
  | String
  | Set_true
  | Set_false
  | Custom of string
  | StringAcc
  (*
  | Tuple of kind list
  *)

type p =
  | Default of string
  | Defaults of string list
  | Required
  | Optional

type spec = string * p * kind * string
(* (command_line_argument, default_value, kind, help_msg) *)

type args = string list

type cmd = spec list


(* Help *)

let type_string = function
  | Int -> "<int>"
  | Float -> "<float>"
  | String -> "<string>"
  | Set_true -> "<set>"
  | Set_false -> "<unset>"
  | StringAcc -> "<string-acc>"
  | Custom t -> "<" ^ t ^ ">"


let get_default_value = function
  | Default def_val ->
      Printf.sprintf " (default: %s)" def_val
  | Defaults def_vals ->
      Printf.sprintf " (defaults: %s)" (String.concat " " def_vals)
  | Required
  | Optional -> ""


let usage prms =
  List.iter (fun (arg, value, kind, msg) ->
    let default_value = get_default_value value in
    let kind = type_string kind in
    Printf.printf "     %s %s%s\n" arg kind default_value;
    Printf.printf "          %s\n" msg;
  ) prms


(* Parsing Command-Line Arguments *)

let arg_of (arg, _, _, _) = arg
let kind_of (_, _, kind, _) = kind

let replace_val value = function
  | (arg, Required, kind, msg)
  | (arg, Optional, kind, msg)
  | (arg, Default _, kind, msg) ->
      (arg, Default value, kind, msg)
  | (arg, Defaults _, kind, msg) ->
      invalid_arg "replace_val"

let push_val value = function
  | (arg, Required, kind, msg)
  | (arg, Optional, kind, msg) ->
      (arg, Defaults (value::[]), kind, msg)
  | (arg, Defaults acc, kind, msg) ->
      (arg, Defaults (value::acc), kind, msg)
  | (arg, Default _, kind, msg) ->
      invalid_arg "push_val"

let is_acc arg prms =
  List.exists (fun prm -> arg_of prm = arg) prms &&
  let prm = List.find (fun prm -> arg_of prm = arg) prms in
  match kind_of prm with
  | Int | Float | String
  | Set_true | Set_false
  | Custom _ -> false
  | StringAcc -> true

let get_value arg prm args =
  match kind_of prm, args with
  | Int, arg::args
  | Float, arg::args
  | String, arg::args -> (arg, args)
  | Set_true, args -> ("true", args)
  | Set_false, args -> ("false", args)
  | Custom _, arg::args -> (arg, args)
  | StringAcc, arg::args -> (arg, args)
  | _, [] ->
      Printf.kprintf invalid_arg
        "Expected argument for: %s" arg


let prm_replace arg args prms =
  let rec aux acc = function
  | prm :: prms ->
      if arg <> (arg_of prm)
      then aux (prm::acc) prms else
        let value, args = get_value arg prm args in
        let prm = replace_val value prm in
        args, List.rev_append acc (prm::prms)
  | [] ->
      Printf.kprintf invalid_arg
        "Unknown argument: %s" arg
  in
  aux [] prms


let prm_push arg args prms =
  let rec aux acc = function
  | prm :: prms ->
      if arg = (arg_of prm)
      then
        let value, args = get_value arg prm args in
        let prm = push_val value prm in
        args, List.rev_append acc (prm::prms)
      else
        aux (prm::acc) prms
  | [] ->
      Printf.kprintf invalid_arg
        "Unknown argument: %s" arg
  in
  aux [] prms


let rec parse prms = function
  | arg :: args ->
      let args, prms =
        if is_acc arg prms
        then prm_push arg args prms
        else prm_replace arg args prms
      in
      parse prms args
  | [] ->
      (List.rev prms)


let parse prms = function
  | ["-h"]
  | ["-help"]
  | ["--help"] -> usage prms; exit 0
  | args -> parse prms args


(* Accessors *)

let list_find arg prms =
  let rec aux = function
  | (_arg, value, kind, msg) :: prms ->
      if arg = _arg then (value, kind) else aux prms
  | [] ->
      Printf.kprintf invalid_arg "Unknown Arg: %s" arg
  in
  aux prms


let get_string prms arg =
  match list_find arg prms with
  | Default value, String -> (value)
  | Default _, _
  | Defaults _, _ ->
      failhere "Args.get_string" (
        Printf.sprintf "%s not a string" arg)
  | Required, _ ->
      failhere "Args.get_string" (
        Printf.sprintf "%s required" arg)
  | Optional, _ ->
      failhere "Args.get_string" (
        Printf.sprintf "%s optional" arg)


let get_string_list prms arg =
  match list_find arg prms with
  | Defaults acc, StringAcc -> (List.rev acc)
  | Optional, StringAcc -> []
  | Default _, _ ->
      failhere "Args.get_string_list" (
        Printf.sprintf "%s should have Defaults, not Default" arg)
  | Defaults _, _ ->
      failhere "Args.get_string_list" (
        Printf.sprintf "%s not a string accum" arg)
  | Required, _ ->
      failhere "Args.get_string_list" (
        Printf.sprintf "%s required" arg)
  | Optional, _ ->
      failhere "Args.get_string_list" (
        Printf.sprintf "%s optional" arg)


let get_int prms arg =
  match list_find arg prms with
  | Default value, Int ->
      begin try (int_of_string value)
      with Failure _ ->
        invalid_arg "Args.get_int"
      end
  | Default _, _
  | Defaults _, _
  | Required, _
  | Optional, _ ->
      failwith "Args.get_int"


let get_float prms arg =
  match list_find arg prms with
  | Default value, Float ->
      begin try (float_of_string value)
      with Failure _ ->
        invalid_arg "Args.get_float"
      end
  | Default _, _
  | Defaults _, _
  | Required, _
  | Optional, _ ->
      failwith "Args.get_float"


let get_bool prms arg =
  match list_find arg prms with
  | Default value, Set_true
  | Default value, Set_false ->
      begin try (bool_of_string value)
      with Failure _ ->
        invalid_arg "Args.get_bool"
      end
  | Default _, _
  | Defaults _, _
  | Required, _
  | Optional, _ ->
      failwith "Args.get_bool"


let get_custom f prms arg =
  match list_find arg prms with
  | Default value, Custom _ ->
      begin try (f value)
      with _ ->
        Printf.kprintf invalid_arg
          "Args.get_custom: %s" arg
      end
  | Default _, _
  | Defaults _, _
  | Required, _
  | Optional, _ ->
      failwith "Args.get_custom"


let get_int_opt prms arg =
  try Some (get_int prms arg)
  with _ -> None

let get_float_opt prms arg =
  try Some (get_float prms arg)
  with _ -> None

let get_bool_opt prms arg =
  try Some (get_bool prms arg)
  with _ -> None

let get_string_opt prms arg =
  try Some (get_string prms arg)
  with _ -> None

let get_custom_opt f prms arg =
  try Some (get_custom f prms arg)
  with _ -> None

