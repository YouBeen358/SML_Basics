(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)



fun stream_permute_list(xs: 'a list): 'a list stream =
  let
    fun put(x, []) = [[x]]
    | put(x, (y::ys)) =
     (x::y::ys) :: list_map((put(x, ys)), (fn ys => y::ys))

    fun permute [] = list_streamize [[]]
      | permute (x::xs) =
        stream_concat (stream_make_map (permute xs, fn x1 => list_streamize (put(x, x1))))
  in
    permute xs
  end




(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01.sml] *)
