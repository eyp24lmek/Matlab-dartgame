# Matlab-Dartgame
MATLAB Dart Throwing Simulation

Code Explanation:

    Cleanup Process:
        clear all; close all; clc clears the workspace, closes figures, and resets the command window.

    Parameters:
        board_size = 10: Defines a 10x10 dartboard grid.
        r = 3: Radius of the valid scoring area.
        (xc, yc) = (5,5): Center of the dartboard.
        points: Tracks the player's total score.
        penalty_points: Counts consecutive missed throws.
        level: Determines the penalty system (0 for lenient, 1 for strict).

    Main Game Loop (10 Throws):
        Generates random dart positions (A, B).
        Calculates the distance from the dart to the board center.
        Checks if the dart lands within the valid scoring area.
        Assigns hits to quadrants:
            Quadrant I: (Top-Right)
            Quadrant II: (Top-Left)
            Quadrant III: (Bottom-Left)
            Quadrant IV: (Bottom-Right)
        Updates the score based on hits and penalties for consecutive misses.

    Penalty System:
        If the player is at level 1, 3 consecutive misses deduct 1 point.
        If the player is at level 0, a penalty is applied only on the 3rd miss.

    Error Handling:
        Uses a try-catch block to prevent runtime errors.

    Final Score Display:
        Prints the total points after 10 throws.
