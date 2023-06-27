(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-20: 20 points
Please implement the following function
that enumerates all the pairs (i, j) of natural
numbers satisfying $i <= j$; a pair (i1, j1) must
be enumerated ahead of another pair (i2, j2) if the
following condition holds:
  i1*i1*i1 + j1*j1*j1 < i2*i2*i2 + j2*j2*j2
//
val
theNatPairs_cubesum: (int * int) stream = fn () => ...
//
*)

fun generate_stream(num: int, start: int, fopr: int -> 'a): 'a stream =
  let
    fun generate_helper(i: int): 'a stream = fn () =>
      strcon_cons(fopr(i), generate_helper(i + 1))
  in
    if num < 0 then
      generate_helper(start)
    else
      let
        fun generate_helper2(i: int): 'a stream = fn () =>
          if i >= num then
            strcon_nil
          else
            strcon_cons(fopr(i), generate_helper2(i + 1))
      in
        generate_helper2(start)
      end
  end

fun generate_pairs_stream(n : int) : (int * int) stream =
  generate_stream(~1, n, fn(i) => (n, i))

val theNatPairs_cubesum: (int * int) stream =
  let
    fun cube(n: int) : int = n * n * n

    fun compare_pairs((i1, j1): int * int, (i2, j2): int * int): bool =
      cube(i1) + cube(j1) <= cube(i2) + cube(j2)

    fun generate_pairs(nth_pair: int): (int * int) stream = fn () =>
      strcon_cons(
        (0, nth_pair),
        stream_merge2(
          generate_pairs_stream(nth_pair),
          generate_pairs(nth_pair + 1),
          compare_pairs
        )
      )
  in
    stream_cons((0, 0), generate_pairs 1)
  end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-02.sml] *)
