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

fun other (n: int, cumulative: real): real strcon =
    let
      fun sum():real= 
        if n mod 2 <> 0 then cumulative + 1.0/Real.fromInt(n)

        else cumulative - 1.0/Real.fromInt(n)
    in
      strcon_cons(sum(), (fn() => other(n+1 ,sum())))
    end

val the_ln2_stream: real stream = fn() => 
    other(1,0.0)
    




(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
