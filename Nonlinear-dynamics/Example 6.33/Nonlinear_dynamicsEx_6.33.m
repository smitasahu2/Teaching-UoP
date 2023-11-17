%% Author Smita Sahu
% Example 6.33, autocatalytic feedback Model by Griffith 1971
% 
% 𝑥˙=−𝑎𝑥+𝑦
% 𝑦˙=𝑥^2(1+𝑥^2)−𝑏𝑦
% Trivial Fixed point   𝐸0=(0,0) 
% We have other two fixed points
% 𝐸1,2=⎛1±√(1−4𝑎^2𝑏^2)/2𝑎𝑏,1±√(1−4𝑎^2𝑏^2)/2𝑏)
% In the code, I'm generating plots for both the nullcline curves and a 
% movie to illustrate how a saddle-node bifurcation manifests in the system as the parameter 'a' varies."
%
clc; clear; close all;
% Define range for x
x = linspace(0, 5, 100);

% Create figure for plotting
figure('Name','Example 6.33');
hold on;

% Parameters
b = 2.5; % Set the value of b (I have fixed the value for b but you can change it as you like)

% Set the number of frames for the movie
num_frames = 100;

% Preallocate the movie structure
movie_frames(num_frames) = struct('cdata', [], 'colormap', []);

% Create movie writer object
writerObj = VideoWriter('saddle-node-bifurcation');
writerObj.FrameRate = 2000; % Set frame rate (speed) for the movie
open(writerObj);

% Calculate nucllclines for different 'a' values and create movie frames
for i = 1:num_frames
    % Current value of 'a' for this frame
    a = i / num_frames * 0.3; % Vary 'a' from 0 to 0.3

    % Calculate functions y =ax and y = x^2/((1+x^2)b) for current value of the parameter 'a'
    y1 = a * x;
    y2 = x.^2 ./ ((1 + x.^2) * b);
    
    % Plot nullcline y = y = x^2/((1+x^2)b) 
    plot(x, y2, 'b', 'LineWidth', 1.5, 'DisplayName', '$y = \frac{x^2}{(1+x^2)b}$')
    hold on
    % Plot y = ax for current 'a'
    y = a * x;
    plot(x, y1, 'r', 'LineWidth', 1.5, 'DisplayName', '$y = ax$')
    grid on;
    ylim([0 0.5]); % Ensure y-axis limits remain constant
    xlim([0 3])
    xlabel('$x$','Interpreter', 'latex', 'FontSize', 16)
    ylabel('Nullclines curves','FontName', 'Times', 'FontSize', 16)
    % Update title with current 'a' value
    title(['Value of the parapeter $a$ =' num2str(a)],'Interpreter', 'latex', 'FontName', 'Times', 'FontSize', 16)
    legend('Location', 'best','Interpreter', 'latex', 'FontSize', 16)
   
    % Lines below is for saving a movie you can igrnore these lines
    % Add frame to movie structure
    movie_frames(i) = getframe(gcf);
    writeVideo(writerObj, movie_frames(i)); % Write frame to video
    clf; % Clear current figure for the next frame
    ylim([0 0.5]); % Ensure y-axis limits remain constant
    xlim([0 3])
    xlabel('$x$','Interpreter', 'latex', 'FontSize', 16)
    ylabel('Nullclines curves','FontName', 'Times', 'FontSize', 16)
    title(['Value of the parapeter $a$ =' num2str(a)],'Interpreter', 'latex', 'FontName', 'Times', 'FontSize', 16)
    legend('Location', 'best','Interpreter', 'latex', 'FontSize', 16)
end

% Close the movie writer object
close(writerObj);
