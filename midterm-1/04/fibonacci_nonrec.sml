(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Fibonacci numbers can be recursively
defined as follows:
fun fibonacci(x: int): int =
  if x >= 2
  then fibonacci(x-2)+fibonacci(x-1) else x
Please use int1_foldleft to implement the
function fibonacci WITHOUT using recursion.
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)

fun fibonacci_nonrec(x: int): int =
  if x <= 2 then 1
  else
    let
      val fibonacci_list = int1_foldleft(x, [1, 1], fn (acc, n) => list_append(acc, n))
    in
      list_append(List.last(fibonacci_list), List.nth(fibonacci_list(x-1)))

    end

  (*
fun fibonacci_nonrec(x: int): int =
  if x <= 2 then 1
  else
    let
      val fibonacci_list = int1_foldleft(x - 2, [1, 1], fn (acc, _) =>
        let
          val next = List.last acc + List.nth(acc, length(acc) - 2)
        in
          acc @ [next]
        end
      )
    in
      List.last(fibonacci_list)
    end*)


(*
val
int1_foldleft =
fn(xs,r0,fopr) =>
foreach_to_foldleft(int1_foreach)(xs,r0,fopr)
val
int1_foldright =
fn(xs,r0,fopr) =>
int1_foldleft(xs, r0, fn(r0, x0) => fopr(xs-1-x0, r0))

int1_foldleft(9, [], fn(acc, n) => list_append(acc, [n]));
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-fibonacci.sml] *)
