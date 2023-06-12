(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

fun list_longest_ascend(xs: int list): int list =
  let
    fun select([], _) = []
      | select(x :: xs', y) =
          if x >= y then x :: select(xs', y)
          else select(xs', y)

    fun longest([]) = []
      | longest(x :: xs') =
          let
            val res1 = longest(select(xs', x))
          in
            if list_length(x :: res1) >= list_length(longest(xs'))
            then x :: res1
            else longest(xs')
          end
  in
    longest(xs)
  end;
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)
