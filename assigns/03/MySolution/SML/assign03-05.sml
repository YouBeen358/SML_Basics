(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () => ...
*)

val theNatPairs: (int * int) stream = fn () =>
  let
    fun check ((i1, j1), (i2, j2)) =
      i1 + j1 < i2 + j2

    val pair_up = stream_concat (stream_tabulate (10000, fn i =>
      stream_make_map (int1_streamize (i + 1), fn j => (i - j, j))
    ))

    val pairsort = stream_make_filter (pair_up, fn s => true)

  in
    pairsort ()
  end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-05.sml] *)
