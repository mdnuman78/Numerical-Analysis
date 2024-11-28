function [x] = lu_system(A, b, n)
% A is a matrix that should not need pivoting
% b is the constant vector
% n is the number of row/column


U(1,1:n)=A(1,1:n);
L(2:n, 1)= A(2:n, 1)/U(1,1);

for i=1:n
    L(i, i)=1;
end

%constructing L and U
for i=2:n
    
    for j=i:n
        
        s=0;
        for k=1:i-1
            s=s+L(i, k)*U(k, j);
        end
        U( i,j)=A(i, j)-s;
    end
    
    
    for j=i+1:n
        s=0;
        for k=1:i-1
            s=s+L(j, k) * U(k, i);
        end
        L(j, i)=(1/U(i,i )) * ( A(j, i) - s );
    end
    
    
end


y(1)=b(1,1);
for i=2:n
    y(i)=b(i,1);
    for j=1: i-1
        y(i)=y(i)- L(i, j)*y(j);
    end
end


x(n)=y(n)/U(n,n);

for i=n-1:-1:1
    x(i)=y(i);
    for j=i+1:n
        x(i)=x(i)-U(i, j)*x(j);
    end
    x(i)=x(i)/U(i, i);
    
end


return;

end