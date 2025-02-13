(* src: https://github.com/thierry-martinez/ppx_show/blob/master/tests/show/show.ml *)

type enum = A | B of int | C of bool * int | D of { a : int; b : string }
  [@@deriving show]

let exit_code = ref 0

let string_match line s s' =
  if s <> s' then
    begin
      Format.eprintf "Mismatch at line %d: got \"%s\" but \"%s\" expected@."
        line (String.escaped s) (String.escaped s');
      exit_code := 1
    end

type 'a poly = A of enum | B of 'a poly * 'a
  [@@deriving show { with_path = false }]

let pp_int fmt _ = Format.pp_print_string fmt "a"

module Test : sig
  type t = A [@@deriving show]
end = struct
  type t = A [@@deriving show]
end
