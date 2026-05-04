
let default_prm = [
  ("--num-prims", Args.Default "12",    Args.Int,      "number of primitives");
  ("--gene-freq", Args.Default "60",    Args.Float,    "genetic frequency");
  ("--verbose",   Args.Default "false", Args.Set_true, "verbosity");
]

let () =
  Args.usage default_prm;
  let args = List.tl (Array.to_list Sys.argv) in
  let prm = Args.parse default_prm args in
  let num_prims = Args.get_int prm "--num-prims" in
  let gene_freq = Args.get_float prm "--gene-freq" in
  let verbose = Args.get_bool prm "--verbose" in

  Printf.printf "\n";
  Printf.printf "# NUM_PRIMS = %d\n" num_prims;
  Printf.printf "# GENE_FREQ = %g\n" gene_freq;
  Printf.printf "# VERBOSE   = %B\n" verbose;
;;

