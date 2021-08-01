n= 2601; %odd 
E = LatticeGraph(sqrt(n));
m = length(E);

x = zeros(1,n);
n_male = (n+1)/2; %male population
n_female = n - n_male; %female population
x_male = zeros(1, n_male);
x_female = zeros(1, n_female);
u = randi(n);
x(u) = 1;
if mod(u,2)==1
    x_male((u+1)/2)=1;
else
    x_female(u/2)=1;
end

t = 0;
T = [];
Tf = [];
Tm = [];
XV = zeros(1,n);
MV = zeros(1, n_male);
FV = zeros(1, n_female);
twoV=zeros(1,m);
while sum(x)<n
            
    k = randi(m);
    v1 = E(k,1);
    v2 = E(k,2);
    twoV(k)=1;
    j = randi(m);
    
    i1 = E(j,1);
    i2 = E(j,2);
    if twoV(j)~=1
        if mod(i1,2)==1
            if mod(i2,2)==1 
                if rand<0.4
                    x_male((i1+1)/2) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.4
                     x_male((i2+1)/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  mod(i2,2)==0 
                if rand<0.4
                 x_male((i1+1)/2) = max(x(i1),x(i2));
                 x(i1) = max(x(i1),x(i2));    
                end
                 if rand<0.6
                     x_female(i2/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        elseif mod(i1,2)==0
            if mod(i2,2)==1 
                if rand<0.6
                     x_female(i1/2) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.4
                     x_male((i2+1)/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  mod(i2,2)==0 
                if rand<0.6
                    x_female(i1/2) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));     
                end
                 if rand<0.6
                     x_female(i2/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        end
    else
        if mod(i1,2)==1
            if mod(i2,2)==1 
                if rand<0.1
                    x_male((i1+1)/2) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.1
                     x_male((i2+1)/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  mod(i2,2)==0
                if rand<0.1
                    x_male((i1+1)/2) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));     
                end
                 if rand<0.1
                     x_female(i2/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        elseif mod(i1,2)==0
            if mod(i2,2)==1 
                if rand<0.1
                    x_female(i1/2) = max(x(i1),x(i2));
                    x(i1) = max(x(i1),x(i2));
                end
                 if rand<0.1
                     x_male((i2+1)/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end
            elseif  mod(i2,2)==0 
                if rand<0.1
                     x_female(i1/2) = max(x(i1),x(i2));
                     x(i1) = max(x(i1),x(i2));    
                end
                 if rand<0.1
                     x_female(i2/2) = max(x(i1),x(i2));
                     x(i2) = max(x(i1),x(i2));
                 end             
            end
        end        
    end 
%         
%     if mod(v1,2)==1
%       XV(v1)=1;
%       MV((v1+1)/2)=1;
%     else
%       XV(v1)=1;
%       FV(v1/2)=1; 
%     end
%      if mod(v2,2)==1
%       XV(v2)=1;
%       MV((v2+1)/2)=1;
%     else
%       XV(v2)=1;
%       FV(v2/2)=1; 
%     end   
%            
    t = t+1;
    T(t) = sum(x);
    Tm(t) = sum(x_male);
    Tf(t) = sum(x_female);
end

figure 
plot(T,'r')
ylabel('sum(x)');

figure 
plot(Tf,'r')
ylabel('sum(x_female)');

figure 
plot(Tm,'r')
ylabel('sum(x_male)');