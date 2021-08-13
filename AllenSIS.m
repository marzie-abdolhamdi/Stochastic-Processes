clc, clear all;
N = 1000;  %population
G = 0.5;   %Gamma
B = 0.6;   %Beta
delta_t = 0.01;
T = 10000;  %t end
I = [];  %number of infectious
S = [];  %number of susceptible
I(1) = 2;
S(1) = N - I(1);
t = 0;
i = 1;
for t = 0:delta_t:T-delta_t

    p1 = ((B*S(i)*I(i))/N)*delta_t;
    p2 = G*I(i)*delta_t;
    p3 = 1-(p1+p2);
    u = rand;
    if u<=p1
        S(i+1)=S(i)-1;
        I(i+1)=I(i)+1;
    elseif u>p1 && u<=p1+p2
        S(i+1)=S(i)+1;
        I(i+1)=I(i)-1;   
    else
        S(i+1)=S(i);
        I(i+1)=I(i); 
    end
    i = i+1;
end

figure 
plot(I,'b')
ylabel('number of infectious');



