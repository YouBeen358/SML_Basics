(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)
fun
stream_ziplst(xs: 'a stream list): 'a list stream = fn() => 

let 
    fun helper (lst: 'a stream list, n: int) = 
        strcon_cons(
            list_foldr(lst, [], fn(stm, res) => stream_get_at(stm, n) :: res ),
            fn() => helper(lst, n+1)
            ) handle Subscript => strcon_nil

in
    helper(xs, 0)

end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-08.sml] *)
