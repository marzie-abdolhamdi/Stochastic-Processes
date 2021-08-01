function epirecoverin2D(n,m)

A = zeros(n);
H = zeros(n);
A(floor(n/2),floor(n/2)) = 1;
H(floor(n/2),floor(n/2)) = 1;

colormap jet;
image(40+15*A); axis square; drawnow;
t=0;
while sum(sum(A))< n^2
    for s=1:m
        i = randi(n,1,2);
        j = sign(rand(1,2)-0.5); l = (rand<0.5);
        k = i+j.*[l, 1-l];
        if min(k)>0 & max(k)<(n+1)
            M = max(A(i(1), i(2)),A(k(1),k(2)));
            A(i(1), i(2)) = M;
            H(i(1), i(2)) = M;
            A(k(1),k(2)) = M;
            H(k(1),k(2)) = M;
            
        end
    end
    [rowNzero,colNzero] = find(H);
    H(rowNzero,colNzero) = H(rowNzero,colNzero)+1;
    [row14,col14] = find(H==14);
    H(row14,col14)= 0;
    A(row14,col14)= 0;        
      
    image(40+15*A); axis square;
    drawnow;
    if sum(sum(A))== 0
        break
    end
    t= t+1
end
end

            