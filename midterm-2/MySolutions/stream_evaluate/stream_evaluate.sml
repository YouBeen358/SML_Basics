(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a stream fxs of real numbers a0, a1, a2, ...
and a real number x0, stream_evaluate(fxs, x0)
returns another stream of real number that enumerates
all of the following partial sums:
a0, a0 + a1*x0, a0 + a1*x0 + a2*x0^2, ...
The general form of the enumerated sums is given as follows
(a0 + a1*x0 + a2*x0^2 + ... + an * x0^n)
*)

(* ****** ****** *)

(*
fun
stream_evaluate
( fxs
: real
  stream
, x0: real): real stream = ...
*)
fun power_real(x: real, n: int): real =
    let
        fun power_positive(x, n) =
            if n = 0 then 1.0
            else if n mod 2 = 0 then
                let
                    val y = power_positive(x, n div 2)
                in
                    y * y
                end
            else
                x * power_positive(x, n - 1)
    in
        if n >= 0 then power_positive(x, n)
        else 1.0 / power_positive(x, ~n)
    end

fun stream_evaluate(fxs: real stream, x0: real): real stream =
    let
        fun helper(fxs, xn, n) = fn() =>
            case fxs() of
                strcon_nil => strcon_nil
              | strcon_cons(a, fxs') =>
                let
                    val x1 = xn + a * power_real(x0, n)
                in
                    strcon_cons(x1, helper(fxs', x1, n + 1))
                end
    in
        helper(fxs, 0.0, 0)
    end
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_evaluate.sml] *)
