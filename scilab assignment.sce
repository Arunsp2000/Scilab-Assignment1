n=3;
function[x]= GaussElim(a)
    for i=2:n
        for j=2:n+1
            a(i,j)=a(i,j)-a(1,j)*a(i,1)/a(1,1)
        end
        a(i,1)=0
    end
    for i=3:n
        for j=3:n+1
            a(i,j)=a(i,j)-a(2,j)*a(i,2)/a(2,2)
        end
        a(i,2)=0
    end
    x(n)=a(n,n+1)/a(n,n);
    for i=n-1:-1:1
        sumk=0;
        for k=i+1:n
            sumk=sumk+a(i,k)*x(k);
        end
        x(i)=(a(i,n+1)-sumk)/a(i,i)
    end
    disp(x(3),x(2),x(1),'The values of x,y,z are')

end

function[L,U]=LUdecompose(A)
    U=A
    m=det(U(1,1))
    n=det(U(2,1))
    a=n/m
    U(2,:)=U(2,:)-U(1,:)/(m/n)
    n=det(U(3,1));
    b=n/m;
    U(3,:)=U(3,:)-U(1,:)/(m/n)
    m=det(U(2,2))
    n=det(U(3,2))
    c=n/m
    U(3,:)=U(3,:)-U(2,:)/(m/n);
    L=[1,0,0;a,1,0;b,c,1]
    disp(U,'The upper triangular matrix')
    disp(L,'The lower triangular matrix')
end

function[B]=inverse(A)
    aug=[A,eye(n,n)];
    for j=1:n-1
        for i=j+1:n
            aug(i,j:2*n)=aug(i,j:2*n)-aug(i,j)/aug(j,j)*aug(j,j:2*n)
        end
    end
    for j=n:-1:2
        aug(1:j-1,:)=aug(1:j-1,:)-aug(1:j-1,j)/aug(j,j)*aug(j,:)
    end
    for j=1:n
        aug(j,:)=aug(j,:)/aug(j,j)
    end
    B=aug(:,n+1:2*n)
    disp(B,'The inverse of coeffecient is')  
end


interuppt=0;
while interuppt~=1 do
clc()
printf('Enter the options\n')
printf('1.Gaussian Elimination\n2.LU Decomposition\n3.Inverse\n4.Exit\n')
op=input('Enter option number')
select op
case 1
    for i=1:n
    for j=1:n
        x=input("Enter Coeffecient Matrix (3X3)");
        coef(i,j)=x;
end
end

for i=1:n
    z=input("Enter Constant Matrix")
    b(i,1)=z
end
[x]=GaussElim([coef b])
case 2
for i=1:n
    for j=1:n
        x=input("Enter Coeffecient Matrix (3X3)");
        coef(i,j)=x;
end
end
[L,U]=LUdecompose(coef)
case 3
    for i=1:n
    for j=1:n
        x=input("Enter Coeffecient Matrix (3X3)");
        coef(i,j)=x;
end
end
[B]=inverse(coef)
end
interuppt=input('Enter 1 to exit and 2 to continue')
end


