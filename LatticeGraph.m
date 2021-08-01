function E = LatticeGraph(k);

n = k^2;
ind = reshape(1:n,k,k);

E = zeros(2*k*(k-1),2);

t = 1;

for i = 1:k
    for j = 1:(k-1)
        E(t,:) = [ind(i,j),ind(i,j+1)];
        E(t+1,:) = [ind(j,i),ind(j+1,i)];
        t = t+2;
    end
end