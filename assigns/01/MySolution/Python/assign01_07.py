####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_mergesort (see list_mergesort in assign01-lib.sml)
#
####################################################
def mylist_mergesort(xs):
    def split(xs):
        if mylist_nilq(xs):
            return (mylist_nil(), mylist_nil())
        else:
            x1 = xs.cons1
            xs_rest = xs.cons2
            if mylist_nilq(xs_rest):
                return (mylist_cons(x1, mylist_nil()),mylist_nil())
            else:
                x2 = xs_rest.cons1
                xs_rest = xs_rest.cons2
                (ys, zs) = split(xs_rest)
                return (mylist_cons(x1,ys), mylist_cons(x2,zs))


    def merge(ys, zs):
        if mylist_nilq(ys):
            return zs
        else: 
            y1 = ys.cons1
            ys_rest = ys.cons2
            if mylist_nilq(zs):
                return (mylist_cons(y1, ys_rest))
            else:
                z1 = zs.cons1
                zs_rest = zs.cons2
                if (y1 <= z1):
                    return (mylist_cons(y1, merge(ys_rest, mylist_cons(z1,zs_rest))))
                else:
                    return (mylist_cons(z1, merge(mylist_cons(y1, ys_rest),zs_rest)))
    
    if mylist_nilq(xs):
        return mylist_nil()
    else:
        x1 = xs.cons1
        xs_rest = xs.cons2
        if mylist_nilq(xs_rest):
            return mylist_cons(x1, mylist_nil())
        else:
            x2 = xs_rest.cons1
            xs_rest = xs_rest.cons2
            ys, zs = split(xs_rest)
            return merge(mylist_mergesort(mylist_cons(x1, ys)),mylist_mergesort(mylist_cons(x2, zs)))
    

"""
fun
list_mergesort
(xs: int list): int list =
let

fun
split
(xs: int list): int list * int list =
(
case xs of
  nil => ([], [])
| x1 :: xs =>
(
  case xs of
    nil => ([x1], [])
  | x2 :: xs =>
    let
      val
      (ys, zs) = split(xs)
    in
      (x1 :: ys, x2 :: zs)
    end
)
)

fun merge
( ys: int list
, zs: int list): int list =
(
case ys of
  nil => zs
| y1 :: ys =>
(
  case zs of
    nil => y1 :: ys
  | z1 :: zs =>
    if y1 <= z1
    then y1 :: merge(ys, z1 :: zs)
    else z1 :: merge(y1 :: ys, zs)
)
)

in

case xs of
  nil => []
| x1 :: xs =>
(
  case xs of
    nil => [x1]
  | x2 :: xs =>
    let
      val (ys, zs) = split(xs)
    in
      merge(list_mergesort(x1 :: ys), list_mergesort(x2 :: zs))
    end
)

end (* end-of-[list_mergesort]: let *)"""