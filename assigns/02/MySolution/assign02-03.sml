(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)
fun list_tabulate(n: int, f: int -> 'a): 'a list =
    let
        fun loop(i: int, acc: 'a list): 'a list =
            if i >= n then
                acc
            else
                loop(i + 1, acc @ [f(i)])
    in
        loop(0, [])
    end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-03.sml] *)
