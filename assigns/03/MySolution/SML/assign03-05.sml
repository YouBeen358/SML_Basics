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

val theNatPairs: (int * int) stream = 
  let
    fun helper(i: int, j: int): (int * int) stream = fn () =>
      strcon_cons((i, j), helper(i, j+1))
  in
    helper(0, 0)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-05.sml] *)
