%Gender is considered
%Complete graph
%Recovery time = 2 weeks
clc, clear all;

n = 100; %population
m = 10;
n_male = ceil(50.7 * n /100); %male population
n_female = n - n_male; %female population

x = zeros(1,n); 
x_male = zeros(1, n_male);
x_female = zeros(1, n_female);
xR = zeros(1,n);
xR_male = zeros(1, n_male);
xR_female = zeros(1, n_female);

pf = 0.6;
pm = 0.4;
% initial point
if rand<0.5  
  x_female(1)=1;
  xR_female(1)=1;
else
  x_male(1)=1;
  xR_male(1)=1;
end
% 
% if rand<0.5  
%   x_female(5)=1;
%   xR_female(5)=1;
% else
%   x_male(5)=1;
%   xR_male(5)=1;
% end

x(1)= 1;
xR(1)=1;

t = 0;
Tx = [];
Tf = [];
Tm = [];

while sum(x)<n
    for k=1:m
        %choos 2 random person among male & female
        i1=randi(n_female);
        i2=randi(n_male);
        j1=randi(n_female);
        j2=randi(n_male);

        if rand<0.5
            i = i1;
        else
            i = i2;
        end
        if rand<0.5
            j = j1;
        else
            j = j2;
        end

        if i==i1 && x_female(i)==1
            if j==j1 && rand<0.6
                x_female(j1)=1;
                xR_female(j1)=1;
                x(n_male+j1)=1;
                xR(n_male+j1)=1;
            elseif j==j2 && rand<0.4
                x_male(j2)=1;
                xR_male(j2)=1;
                x(j2)=1;
                xR(j2)=1;
            end
        elseif i==i2 && x_male(i)==1
            if j==j1 && rand<0.6
                x_female(j1)=1;
                xR_female(j1)=1;
                x(n_male+j1)=1;
                xR(n_male+j1)=1;
            elseif j==j2 && rand<0.4
                x_male(j2)=1;
                xR_male(j2)=1;
                x(j2)=1;
                xR(j2)=1;      
            end       
        end

        if j==j1 && x_female(j)==1
            if i==i1 && rand<0.6
                x_female(i1)=1;
                xR_female(i1)=1;            
                x(n_male+i1)=1;
                xR(n_male+i1)=1;                          
            elseif i==i2 && rand<0.4
                x_male(i2)=1;
                xR_male(i2)=1;
                x(i2)=1;
                xR(i2)=1;            
            end
        elseif j==j2 && x_male(j)==1
            if i==i1 && rand<0.6
                x_female(i1)=1;
                xR_female(i1)=1;            
                x(n_male+i1)=1;
                xR(n_male+i1)=1;                   
            elseif i==i2 && rand<0.4
                x_male(i2)=1;
                xR_male(i2)=1;            
                x(i2)=1;
                xR(i2)=1;            

            end       
        end  
    end
    
    nonzeros_xR = find(xR);
    xR(nonzeros_xR) = xR(nonzeros_xR)+1;
    nonzeros_xR_male = find(xR_male);
    xR_male(nonzeros_xR_male) = xR_male(nonzeros_xR_male)+1;   
    nonzeros_xR_female = find(xR_female);
    xR_female(nonzeros_xR_female) = xR_female(nonzeros_xR_female)+1;   
      
    weeksXR = find(xR==14);
    xR(weeksXR)= 0;
    x(weeksXR)= 0;
    weeksXRmale = find(xR_male==14);
    xR_male(weeksXRmale)= 0;
    x_male(weeksXRmale)= 0;
    weeksXRfemale = find(xR_female==14);
    xR_female(weeksXRfemale)= 0;
    x_female(weeksXRfemale)= 0;
    
    t = t+1
    Tx(t) = sum(x);
    Tx(t)
    Tf(t) = sum(x_female);
    Tm(t) = sum(x_male);
    if sum(x)==0
        break
    end
end
figure 
plot(Tx,'b')
ylabel('sum(x)');

figure 
plot(Tf,'b')
ylabel('sum(x_female)');
figure 
plot(Tm,'b')
ylabel('sum(x_male)');

