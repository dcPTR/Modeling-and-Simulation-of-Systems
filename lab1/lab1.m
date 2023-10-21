clear;

alpha_list = [];
v_list = [];
T_max_list = [];
generations = 100000;
g = 10;
X_cross = 7;
Y_cross = 3;

figure;
hold on;
grid on;

for i = 1:generations
    alpha = rand() * 88 + 1; % Random angle in degrees
    alpha = deg2rad(alpha); % Convert to radians
    v0 = rand() * 29 + 1; % Random initial velocity
    
    v0x = v0 * cos(alpha);
    v0y = v0 * sin(alpha);
    
    % Must not cross region
    t1 = X_cross / v0x;
    yt1 = v0y * t1 - 1/2 * g * t1 * t1;
    if ((yt1 > 4 && yt1 < 5) || (yt1 > 7 && yt1 < 8))
        continue;
    end

    % Must cross region
    a = -1/2 * g;
    b = v0y;
    c = -Y_cross;
    delta = b * b - 4 * a * c;
    sdelta = sqrt(delta);
    t1 = (-b - sdelta) / (2 * a);
    t2 = (-b + sdelta) / (2 * a);
    xt1 = v0x * t1;
    xt2 = v0x * t2;

    if (xt2 > 1 && xt2 < 5 && xt1 > 9 && xt1 < 13)
        % Both sections are crossed
        alpha_list = [alpha_list alpha];
        v_list = [v_list v0];

        t = linspace(0, 3, 500);
        x = v0x * t;
        y = v0y * t - 1/2 * g * t .* t;
        plot(x, y);
    end
end

% Must cross region plot
plot([1 5], [3 3], 'g');
plot([9 13], [3 3], 'g');

% Must not cross region plot
plot([7 7], [4 5], 'r');
plot([7 7], [7 8], 'r');

xlabel("x");
ylabel("y");
title("Trajectory");
xlim([0 15]);
ylim([0 15]);
savefig("Trajectory");

hold off;

figure;
grid on;
scatter(alpha_list, v_list, ".");
xlabel("\alpha");
ylabel("v_0");
title("Allowed v_0 and \alpha");
savefig("V0_Alpha");

probability = size(alpha_list, 2) / generations * 100;
fprintf("Probability of a valid trajectory: %.2f%% \n", probability);
