(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

(*
fun
perm_capture_231
(xs: int list): bool = ...
*)

fun zip3 (xs, ys, zs) =
    case (xs, ys, zs) of
        ([], _, _) => []
      | (_, [], _) => []
      | (_, _, []) => []
      | (x::xs', y::ys', z::zs') => (x, y, z) :: zip3 (xs', ys', zs')

fun drop n xs =
    if n <= 0 orelse List.null xs then
        xs
    else
        drop (n - 1) (List.tl xs)

fun perm_capture_231(xs: int list): bool =
    let
        val triplets = zip3 (xs, drop 1 xs, drop 2 xs)
        val checkCapture = fn (a, b, c) => c < a andalso a < b
    in
        List.exists checkCapture triplets
    end 
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-perm_capture_231.sml] *)
