function [power] = calculate_power(velocity, net_force, position, t)
% Calculates power per oscillation by integrating muscle force over muscle
% displacement

    zci = @(v) find(diff(sign(v)));
    position = position;
    zero_crossings = zci(position);

    if length(zero_crossings) >= 10
    cycle_end = zero_crossings(end);
    cycle_start = zero_crossings(end-10);
    f_cycle = net_force(cycle_start:cycle_end);

    velocity_cycle = velocity(cycle_start:cycle_end);
    position_cycle = position(cycle_start:cycle_end);
    delta_t = t(cycle_end) - t(cycle_start);
    power = trapz(position_cycle, f_cycle)/delta_t;

    else
        power = 0;
    end
end

