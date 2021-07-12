n = 100000; %population
x = zeros(1,n); 
n_male = ceil(50.7 * n /100); %male population
n_female = n - n_male; %female population
n_male_child = ceil(24.74 * n_male /100); % 0-14 male population
n_female_child = ceil(24.74 * n_female /100); % 0-14 female population
n_male_adult = ceil(68.69 * n_male /100); % 15-64 male population
n_female_adult = ceil(68.69 * n_female /100); % 15-64 female population
n_male_old = n_male - n_male_child - n_male_adult; % 65 or more male population
n_female_old = n_female - n_female_child - n_female_adult; % 65 or more female population
x_male = zeros(1, n_male);
x_female = zeros(1, n_female);
x_male_child = zeros(1, n_male_child);
x_female_child = zeros(1, n_female_child);
x_male_adult = zeros(1, n_male_adult);
x_female_adult = zeros(1, n_female_adult);
x_male_old = zeros(1, n_male_old);
x_female_old = zeros(1, n_female_old);
pf1 = 0.06;
pf2 = 0.46;
pf3 = 0.48;
pm1 = 0.06;
pm2 = 0.46;
pm3 = 0.48;

% initial point
if rand<0.6   %female are more risky
x_female(1)=1;
else
x_male(1)=1;
end
pf = [pf1, pf2, pf3];
pm = [pm1, pm2, pm3];
cumpf = cumsum(pf);
cumpm = cumsum(pm);
u = rand;
if (x_female(1)==1)
    for i = 1 : length(pf)
        if u <= cumpf(i)
            rf=i;
            break
        end
    end
    if rf == 1
        x_female_child(1)=1;
    elseif rf==2
        x_female_adult(1)=1;
    else
        x_female_old(1)=1;
    end
elseif (x_male(1)==1)
    for i = 1 : length(pm)
        if u <= cumpm(i)
            rm=i;
            break
        end
    end
    if rm == 1
        x_male_child(1)=1;
    elseif rm==2
        x_male_adult(1)=1;
    else
        x_male_old(1)=1;
    end
end

x(1)= 1;
t = 0;
Tx = [];
Tf = [];
Tm = [];
Tf1 = [];
Tf2=[];
Tf3 = [];
Tm1 = [];
Tm2=[];
Tm3 = [];

while sum(x)<n
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
    w=randi(3);
    if i == i1
        if w==1
            urf11=randi(n_female_child);
        elseif  w==2
            urf12=randi(n_female_adult);
        else
            urf13=randi(n_female_old);
        end
    else
       if w==1
            urm11=randi(n_male_child);
        elseif  w==2
            urm12=randi(n_male_adult);
        else
            urm13=randi(n_male_old);
       end 
    end
    
    v = randi(3);
    if j == j1
        if v==1
            urf21=randi(n_female_child);
        elseif  v==2
            urf22=randi(n_female_adult);
        else
            urf23=randi(n_female_old);
        end
    else
       if v==1
            urm21=randi(n_male_child);
        elseif  v==2
            urm22=randi(n_male_adult);
        else
            urm23=randi(n_male_old);
       end 
    end
    
    if i==i1 && x_female(i)==1
        if j==j1 && rand<0.6
            x_female(j1)=1;
            x(randi(n))=1;
        elseif j==j2 && rand<0.4
            x_male(j2)=1;
            x(randi(n))=1;
        end
    elseif i==i2 && x_male(i)==1
        if j==j1 && rand<0.6
            x_female(j1)=1;
            x(randi(n))=1;
        elseif j==j2 && rand<0.4
            x_male(j2)=1;
            x(randi(n))=1;
        end       
    end
    
    if j==j1 && x_female(j)==1
        if i==i1 && rand<0.6
            x_female(i1)=1;
            x(randi(n))=1;
        elseif i==i2 && rand<0.4
            x_male(i2)=1;
            x(randi(n))=1;
        end
    elseif j==j2 && x_male(j)==1
        if i==i1 && rand<0.6
            x_female(i1)=1;
            x(randi(n))=1;
        elseif i==i2 && rand<0.4
            x_male(i2)=1;
            x(randi(n))=1;
        end       
    end   
    
 u = rand;
 if (x_female(i1)==1)
    for i = 1 : length(pf)
        if u <= cumpf(i)
            rf=i;
            break
        end
    end
    if rf == 1
        x_female_child(urf11)=1;
    elseif rf==2
        x_female_adult(urf12)=1;
    else
        x_female_old(urf13)=1;
    end
 elseif (x_male(i2)==1)
    for i = 1 : length(pm)
        if u <= cumpm(i)
            rm=i;
            break
        end
    end
    if rm == 1
        x_male_child(urm11)=1;
    elseif rm==2
        x_male_adult(urm12)=1;
    else
        x_male_old(urm13)=1;
    end
 end
u=rand;
  if (x_female(j1)==1)
    for i = 1 : length(pf)
        if u <= cumpf(i)
            rf=i;
            break
        end
    end
    if rf == 1
        x_female_child(urf21)=1;
    elseif rf==2
        x_female_adult(urf22)=1;
    else
        x_female_old(urf23)=1;
    end
elseif (x_male(j2)==1)
    for i = 1 : length(pm)
        if u <= cumpm(i)
            rm=i;
            break
        end
    end
    if rm == 1
        x_male_child(urm21)=1;
    elseif rm==2
        x_male_adult(urm22)=1;
    else
        x_male_old(urm23)=1;
    end
end

    t = t+1
    Tx(t) = sum(x);
    Tx(t)
    Tf(t) = sum(x_female);
    Tm(t) = sum(x_male);
    Tf1(t) = sum(x_female_child);
    Tf2(t)= sum(x_female_adult);
    Tf3(t) = sum(x_female_old);
    Tm1(t) = sum(x_male_child);
    Tm2(t) = sum(x_male_adult);
    Tm3(t) = sum(x_male_old);
    
end
figure 
plot(Tx,'r')
ylabel('sum(x)');
figure
subplot(4,2,1)
plot(Tf,'r')
ylabel('sum(x_female)');
subplot(4,2,3)
plot(Tf1,'r')
ylabel('sum(x_female_child)');
subplot(4,2,5)
plot(Tf2,'r')
ylabel('sum(x_female_adult)');
subplot(4,2,7)
plot(Tf3,'r')
ylabel('sum(x_female_old)');
subplot(4,2,2)
plot(Tm,'r')
ylabel('sum(x_male)');
subplot(4,2,4)
plot(Tm1,'r')
ylabel('sum(x_male_child)');
subplot(4,2,6)
plot(Tm2,'r')
ylabel('sum(x_male_adult)');
subplot(4,2,8)
plot(Tm3,'r')
ylabel('sum(x_male_old)');
