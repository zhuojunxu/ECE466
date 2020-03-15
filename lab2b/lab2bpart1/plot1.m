[packet_no_p, time_p, packetsize_p] = textread('GeneratorOutput.txt', '%f %f %f');

figure(1);

times1 = zeros(1,90000);
arrivals1 = zeros(1,90000);

times1(1) = time_p(1);
arrivals1(1) = packetsize_p(1);
i=2
while i<=90000
    times1(i) = times1(i - 1) + time_p(i);
    arrivals1(i) = arrivals1(i-1) + packetsize_p(i);
    i=i+1;
end
 


[packet_no_p2, packetsize_p2, arrival_time] = textread('TrafficSinkOutput.txt', '%f %f %f');

times2 = zeros(1,90000);
arrival2 = zeros(1,90000);

times2(1) = arrival_time(1);
arrival2(1) = packetsize_p2(1);
i=2
while i<=90000
    times2(i) = times2(i-1) + arrival_time(i);
    arrival2(i) = arrival2(i-1) + packetsize_p2(i);
    i=i+1;
end

plot(times1,arrivals1, 'b', times2, arrival2, 'r');
title('Traffic Sink (TrafficSinkOutput.txt)');
xlabel('time (in microseconds)');
ylabel('packets arrival (in bytes)');
legend('Generator Output', 'Sink Output');

