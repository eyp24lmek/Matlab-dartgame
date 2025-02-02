% Cleanup process
clear all; close all; clc

% Parameters
board_size = 10;  % Size of the dartboard (10x10 grid)
r = 3;  % Radius of the valid dartboard area
xc = 5;  % X-coordinate of the dartboard center
yc = 5;  % Y-coordinate of the dartboard center
points = 0;  % Initial total points
penalty_points = 0;  % Counter for consecutive misses
level = 0;  % Player's level (0 or 1)

% Main game loop
for i = 1:1:10 % Total of 10 dart throws
    try
        % Generate random dart position (0 to 10)
        A = rand * board_size;  % X-coordinate of the dart (random number)
        B = rand * board_size;  % Y-coordinate of the dart (random number)

        % Calculate the distance from the dart to the center of the dartboard
        dist = ((xc - A)^2 + (yc - B)^2)^0.5;

        % Check if the dart lands inside the valid dartboard area (radius condition)
        if dist < r && ~(A == xc && B == yc) % Exclude the exact center (5,5) as a hit middle
            % Determine which quadrant the dart hits based on A and B
            % (Coordinate system: Quadrants I, II, III, IV) 
            %Top-Left=II.Area %Top Right=I.Area %Bottom-Left=III.Area %Bottom-Right=IV.Area 
            if A < board_size / 2 && B < board_size / 2 
                area = 'II-Area'; %II. Area (A<5 and B>5)
            elseif A >= board_size / 2 && B < board_size / 2
                area = 'I-Area'; %I. Area (A>=5 and B<5)
            elseif A < board_size / 2 && B >= board_size / 2
                area = 'III-Area';%III. Area (A<5 and B>=5)
            elseif A >= board_size / 2 && B >= board_size / 2
                area = 'IV-Area';%IV. Area (A>=5 and B>=5)
            end
            
            disp(['Hit in ', area, '!']); % Display hit in the console
            points = points + 1;  % Increase points for a hit
            penalty_points = 0;  % Reset the miss counter after a hit
        else
            % Dart missed the board (outside the radius)
            disp(['Missed!']); % Display miss in the console
            penalty_points = penalty_points + 1;  % Increment the miss counter
        end

        % Apply level-based penalty logic
        switch level
            case 1
                if penalty_points >= 3
                    points = points - 1;  % Deduct 1 point for 3 consecutive misses
                end
            case 0
                % Less strict penalty for level 0 (3 misses)
                if penalty_points == 3
                    points = points - 1;  % Deduct 1 point for 3 consecutive misses
                    penalty_points = 0;  % Reset the penalty counter
                end
        end
    catch
        % Handle any errors that occur
        disp('An error occurred.');
    end
end

% Display the total points at the end of the game
disp(['Total Points: ', num2str(points)]);
