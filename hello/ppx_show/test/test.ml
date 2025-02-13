open OUnit2
open Show

let test01 _ = assert_equal "Show.Test.A" (Show.Test.show A)

let test02 _ = assert_equal
                "1l" (Format.asprintf "@[%a@]" [%show: int32] 1l)

let test03 _ = assert_equal
                "1L" (Format.asprintf "@[%a@]" [%show: int64] 1L)

let test04 _ = assert_equal
                "1n" (Format.asprintf "@[%a@]" [%show: nativeint] 1n)

let test05 _ = assert_equal
                "1." (Format.asprintf "@[%a@]" [%show: float] 1.)

let test06 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: int option] (Some 1)) "Some (1)"

let test07 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: int ref] (ref 1)) "ref (1)"

let test08 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: int Lazy.t] (lazy 1)) "lazy (1)"

let test09 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: (int,  unit) result] (Error ()))
    "Error (())"

let test10 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: int list] [1; 2; 3]) "[1; 2; 3]"

let test11 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: int * bool * string] (1, false, "a"))
    "(1, false, \"a\")"

let test12 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: [`A | `B of int]] `A) "`A"

let test13 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: [`A | `B of int]] (`B 1)) "`B (1)"

let test14 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: [`A | `B of int * int]] (`B (1, 2)))
    "`B ((1, 2))"

let test15 _ = assert_equal (show_enum A) "Show.A"
let test15b _ = assert_equal
    (Format.asprintf "@[%a@]" pp_enum A) "Show.A"

let test16 _ = assert_equal
    (Format.asprintf "@[%a@]" pp_enum (B 1)) "Show.B (1)"

let test17 _ = assert_equal
    (Format.asprintf "@[%a@]" pp_enum (C (false, 2))) "Show.C (false, 2)"

let test18 _ = assert_equal
    (Format.asprintf "@[%a@]" pp_enum (D { a = 1; b = "foo" }))
    "Show.D ({ a = 1; b = \"foo\" })"

let test19 _ = assert_equal
    (Format.asprintf "@[%a@]" (pp_poly pp_enum) (A A)) "A (Show.A)"

let test20 _ = assert_equal
    (Format.asprintf "@[%a@]" (pp_poly pp_enum) (B (A A, A)))
      "B (A (Show.A), Show.A)"

let test21 _ = assert_equal
    (Format.asprintf "@[%a@]" [%show: int [@show.nobuiltin]] 1) "a"

let suite =
"suite">:::
  [
    "test01">:: test01;
    "test02">:: test02;
    "test03">:: test03;
    "test04">:: test04;
    "test05">:: test05;
    "test06">:: test06;
    "test07">:: test07;
    "test08">:: test08;
    "test09">:: test09;
    "test10">:: test10;
    "test11">:: test11;
    "test12">:: test12;
    "test13">:: test13;
    "test14">:: test14;
    "test15">:: test15;
    "test15b">:: test15b;
    "test16">:: test16;
    "test17">:: test17;
    "test18">:: test18;
    "test19">:: test19;
    "test20">:: test20;
    "test21">:: test21;
  ]

let () =
  run_test_tt_main suite
