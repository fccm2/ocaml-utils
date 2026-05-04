
let exit_code = ref 0

let li = [(1, 10); (2, 20); (5, 50); (3, 30); (2, 2222); (6, 60)]


let string_of_assoc_list li =
  let li = List.map (fun (x, y) -> Printf.sprintf "(%d, %d)" x y) li in
  ("[" ^ (String.concat "; " li) ^ "]")


let test tested should label =
  let result = tested () in
  if result = should
  then Printf.printf "Test %s: OK\n%!" label
  else begin
    exit_code := 1;
    Printf.eprintf "Test %s: ERROR\n" label;
    Printf.eprintf "result: %s\n" (string_of_assoc_list result);
    Printf.eprintf "should: %s\n" (string_of_assoc_list should);
  end


let test ~tested ~should ?(except = "") ~label () =
  try test tested should label
  with e ->
    exit_code := 1;
    let raised = Printexc.to_string e in
    if raised = except
    then Printf.printf "Test %s: OK\n%!" label
    else begin
      exit_code := 1;
      Printf.eprintf "Test %s: ERROR\n" label;
      Printf.eprintf "raised exn: %s\n" (raised);
      Printf.eprintf "expect exn: %s\n" (except);
    end


let test1 () =
  test
    ~label:"Lists.assoc_replace [1]"
    ~tested:(fun () -> Lists.assoc_replace 5 5000 li)
    ~should:[(1, 10); (2, 20); (5, 5000); (3, 30); (2, 2222); (6, 60)]
    ()

let test2 () =
  test
    ~label:"Lists.assoc_replace [2]"
    ~tested:(fun () -> Lists.assoc_replace 2 202 li)
    ~should:[(1, 10); (2, 202); (5, 50); (3, 30); (2, 2222); (6, 60)]
    ()

let test3 () =
  test
    ~label:"Lists.assoc_replace [3]"
    ~tested:(fun () -> Lists.assoc_replace 6 6001 li)
    ~should:[(1, 10); (2, 20); (5, 50); (3, 30); (2, 2222); (6, 6001)]
    ()

let test4 () =
  test
    ~label:"Lists.assoc_replace [4]"
    ~tested:(fun () -> Lists.assoc_replace 8 88 li)
    ~except:(Printexc.to_string (Failure "assoc_replace"))
    ~should:[]
    ()


let () =
  test1 ();
  test2 ();
  test3 ();
  test4 ();
  exit !exit_code;
;;

