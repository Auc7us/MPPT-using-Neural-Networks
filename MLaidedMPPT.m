clear all;
tic %timer start
count = 1;
maxPoint = (zeros(15));%pre allocated memory for 15 steps
for toc = 0:10 %for a maximum of 10 seconds
    x = toc; %Time function
    y = x+799; %Irradiance(can be any function of time) 
    z= 0.5*x+25;% Temperature(can be any function of time)
    simOut = sim('CircuitSetup.slx',0.1); %running circuit for 0.1s
    output = simOut.get('data');
    D = output(:,2);
    P = output(:,3);
    poly = polyfit(D,P,4);%finding the best fit polynomial function 
    der = polyder(poly);
    Dres = min(roots(der));
    maximum_power = polyval(poly,Dres);
    temp = Dres;
    maxPoint(count)= Dres;%updating the resultant array
    count = count + 1 ; 
end
display(maxPoint);% please open to maxpoint variable in workspace for better understanding