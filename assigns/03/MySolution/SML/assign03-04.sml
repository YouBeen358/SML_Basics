(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)
(*
val the_ln2_stream: real stream =
  let
    fun helper(n: int, acc: real): real stream =
      fn () =>
        let
          val term = if n mod 2 = 0 then ~1.0 / real n else 1.0 / real n
        in
          strcon_cons(acc + term, helper(n + 1, acc + term))
        end
  in
    helper(1, 1.0)
  end*)
datatype 'a stream = Cons of 'a * (unit -> 'a stream)

fun the_ln2_stream() =
  let
    fun helper(n: int, acc: real): real stream =
      Cons(acc, fn () => helper(n + 1, acc + (~1.0 / real n)))
  in
    helper(2, 1.0)
  end

val eps = 0.001




(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
