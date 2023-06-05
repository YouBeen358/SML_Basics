####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign01-lib.sml)
#
####################################################

def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    else:
        x1 = xs.cons1
        xs_rest = xs.cons2
        return mylist_cons(x1, mylist_append(xs_rest, ys))

def mylist_quicksort(xs):
    def myqsort(xs):
        if mylist_nilq(xs): 
            return mylist_nil()
        else:
            x1 = xs.cons1
            xs_rest = xs.cons2
            ys, zs = qpart(xs_rest, x1)
            ys = myqsort(ys) 
            zs = myqsort(zs)
            return mylist_append(mylist_append(ys, mylist_cons(x1,mylist_nil())),zs)
    def qpart(xs, p0):
        if mylist_nilq(xs): 
            return (mylist_nil(), mylist_nil())
        else:
            x1 = xs.cons1
            xs_rest = xs.cons2
            ys, zs = qpart(xs_rest, p0)
            if x1 <= p0: 
                return (mylist_cons(x1, ys), zs)
            else:
                return (ys, mylist_cons(x1, zs))
    return (myqsort(xs))




"""
fun
list_quicksort
(xs: int list): int list =
let
(* ****** ****** *)
fun
qsort(xs: int list): int list =
(
case xs of
nil => nil
|
x1 :: xs =>
let
val (ys, zs) = qpart(xs, x1)
val ys = qsort(ys) and zs = qsort(zs)
in
  ys @ [x1] @ zs
end
)
(* ****** ****** *)
and
qpart
(xs: int list, p0: int): int list * int list =
(
case xs of
nil => (nil, nil)
|
x1 :: xs =>
let
val (ys, zs) = qpart(xs, p0)
in
  if x1 <= p0 then (x1 :: ys, zs) else (ys, x1 :: zs)
end
)
(* ****** ****** *)
in
  qsort(xs)
end (* end-of-[list_quicksort]: let *)
"""