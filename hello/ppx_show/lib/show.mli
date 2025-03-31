(* src: https://github.com/thierry-martinez/ppx_show/blob/master/tests/show/show.ml *)


type enum = A | B of int | C of bool * int | D of { a : int; b : string; }
val pp_enum : Format.formatter -> enum -> unit
val show_enum : enum -> string

type 'a poly = A of enum | B of 'a poly * 'a
val pp_poly :
  (Format.formatter -> 'a -> unit) -> Format.formatter -> 'a poly -> unit

val pp_int : Format.formatter -> 'a -> unit
module Test :
  sig
    type t = A
    val pp : Format.formatter -> t -> unit
    val show : t -> string
  end
