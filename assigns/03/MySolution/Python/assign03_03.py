####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-06-12: 10 points
# Please *translate* into Python the SML solution
# to word_neighbors (which is the one for Assign03-02)
#
def word_neighbors(word):
    neighbors = []
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    for i in range(len(word)):
        for ch in alphabet:
            if ch != word[i]:
                neighbor = word[:i] + ch + word[i+1:]
                neighbors.append(neighbor)
    
    return neighbors
###################################################
