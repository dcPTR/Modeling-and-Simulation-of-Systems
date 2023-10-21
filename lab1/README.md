# Trajectory Simulation in MATLAB

This MATLAB code simulates the trajectory of an object moving in a uniform gravitational field. It aims to determine whether the object passes through or avoids specific regions. The code generates random initial values for velocity and angle, then checks whether the trajectory satisfies certain conditions.

## Problem Statement

The problem involves a body moving in a uniform gravitational field, with its position defined by the following equations:

x(t) = v0xt

y(t) = v0yt - 1/2 * gt^2

- `v0x` and `v0y` represent the horizontal and vertical components of the initial velocity.
- `g` denotes the gravitational acceleration.

The objective is to ascertain whether the object's trajectory crosses specific regions, referred to as "forbidden" and "required." These regions are defined by certain coordinates, and the conditions for crossing or avoiding them need to be determined.

## Approach

1. The code generates a large number of random initial values for velocity (`v0`) and angle (`alpha`).
2. It calculates `t1` using the formula `t1 = X_cross / v0x`, where `X_cross` represents the x-coordinate of the boundary of the region, and `v0x` is the horizontal velocity component. This indicates the time required for the object to reach the x-coordinate of the region.
3. Next, the code computes `yt1` using the previously mentioned equation. `yt1` represents the y-coordinate of the object's trajectory at time `t1`.
4. If `yt1` does not meet the criteria for the "forbidden" region, the code proceeds to check whether the trajectory crosses the "required" region.
5. Using quadratic equations, the code calculates the time at which the trajectory crosses the specified y-coordinate (`Y_cross`). Subsequently, it calculates the x-coordinate at that time (`xt1` and `xt2`) using the horizontal velocity component.
6. If both `xt1` and `xt2` fall within the specified x-coordinate range for the "required" region, the trajectory is considered to cross this region.
7. When the conditions are satisfied, the initial velocity and angle are recorded, and the trajectory is plotted.


The code generates plots for both the "required" and "forbidden" regions and calculates the probability of meeting the conditions based on the randomly selected initial values.