(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_drop(fxs, n) = ...
*)
fun stream_drop(fxs, n) =
if n<= 0 orelse List.null xs then xs
else
stream_drop(n-1, List.tl xs)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)
