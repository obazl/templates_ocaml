open OUnit2

let () = print_endline "Starting tests!"

let test1 _ = assert_equal "Hello" (Hello.msg)
let test2 _ = assert_equal 2 (Hello.MyModule.inc 1)
let test3 _ = assert_equal "Goodbye" (Goodbye.msg)
let test4 _ = assert_equal 2 (Goodbye.MyModule.inc 1)


let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2;
    "test3">:: test3;
    "test4">:: test4;
  ]

let () = print_endline "Finished tests!"

let () =
  run_test_tt_main suite

