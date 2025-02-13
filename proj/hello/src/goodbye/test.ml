open OUnit2

let test1 _ = assert_equal "Goodbye" (Goodbye.msg)
let test2 _ = assert_equal 2 (Goodbye.MyModule.inc 1)

let suite =
"suite">:::
  [
    "test1">:: test1;
    "test2">:: test2
  ]

let () =
  run_test_tt_main suite

