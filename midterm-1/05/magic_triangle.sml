(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-06: midterm1-05: 20 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the numbers in the row directly above it.

The following example shows how row 6 is computed from row 5.

row 5:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 6:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ??

Hint: You might want a helper function to compute the current row from
the previous.

*)

(*
fun
magic_triangle (n : int) : int list list = 
val show_partial = fn (st: 'a stream, n: int) =>
  let
    val l = int1_foldleft(n, [], fn (acc, k) => stream_get_at(st, k) :: acc)
  in
    List.rev(l)
  end

val magic_triangle_stream : int list stream = fn () =>
  let
    fun helper(xs) =
      let
        val ys = [1] @ List.foldl (fn (x, acc) => x + List.hd(acc) :: acc) [1] xs
      in
        strcon_cons(xs, fn () => helper(ys))
      end
  in
    helper([1])
  end *)

fun magic_triangle(n : int) =
    let
        fun int1_foldleft(0, store, _) = store
          | int1_foldleft(x, store, f) = 
              let
                  fun inner_fold(0, store2) = store2
                    | inner_fold(y, store2) =
                        inner_fold(y - 1, store2 @ [List.nth(list_last(store), y - 1) + List.nth(list_last(store), y)])
              in
                  int1_foldleft(x - 1, store @ [ [1] @ inner_fold(x, []) @ [1] ], f)
              end
    in
        int1_foldleft(n, [[1]], fn (store, x) =>
            if x = 0 then [[1], [1, 1]]
            else store @ [[1] @ int1_foldleft(x, [], fn (store2, y) => store2 @ [List.nth(list_last(store), y - 1) + List.nth(list_last(store), y)]) @ [1]]
        )
    end

  


(* ****** ****** *)

(*
val () =
assert320
(
magic_triangle(5) =
[[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1]])
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-magic_triangle.sml] *)
