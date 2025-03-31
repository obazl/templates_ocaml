let () =
  Alpha.print_hello () ;
  print_endline ("My str fn: " ^ (Alpha.my_str_fn ())) ;

  Alpha.print_int () ;
  print_endline ("My int fn: " ^ (string_of_int (Alpha.my_int_fn ()))) ;
