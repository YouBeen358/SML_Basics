####################################################
#!/usr/bin/env python3
####################################################
"""
HX-2023-06-19: 10 points
You are required to implement the following function
generator_merge2 WITHOUT using streams. A solution that
uses streams is disqualified.
"""
def generator_merge2(gen1, gen2, lte3):
    """
    Given two generators gen1 and gen2 and a comparison
    function lte3, the function generator_merge2 returns
    another generator that merges the elements produced by
    gen1 and gen2 according to the order specified by lte3.
    The function generator_merge2 is expected to work correctly
    for both finite and infinite generators.
    """
    def merge_elements():
        i1 = iter(gen1)
        i2 = iter(gen2)
        val1 = next(i1, None)
        val2 = next(i2, None)

        while val1 is not None and val2 is not None:
            if lte3(val1, val2):
                yield val1
                try:
                    val1 = next(i1)
                except StopIteration:
                    val1 = None
            else:
                yield val2
                try:
                    val2 = next(i2)
                except StopIteration:
                    val2 = None


        if val1 is not None:
            yield val1
            yield from i1

        if val2 is not None:
            yield val2
            yield from i2

    return merge_elements()





####################################################
