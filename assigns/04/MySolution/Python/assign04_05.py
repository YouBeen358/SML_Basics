########################
# HX-2023-06-20: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""
########################################################################
def wordle_guess(hints):

    # Create a set to store the characters that have been guessed
    guessed_chars = set()

    # Iterate over each hint in reverse order
    for hint in reversed(hints):
        # Extract the character from the hint
        char = hint[1]

        # Check if the character is not in the guessed characters set
        if char not in guessed_chars:
            # Add the character to the guessed characters set
            guessed_chars.add(char)
            # Return the character as the guess
            return char

    # If no valid guess can be made, return None
    return None
########################################################################
