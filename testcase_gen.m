%constants
MAX_M = 512;
MAX_N = 512;
MAX_K = 512;
MAX_AB_VAL = 32767;
MAX_C_VAL = 2147483647;
MIN_AB_VAL = -32768;
MIN_C_VAL = -2147483648;

fnum = 0;
while (1)
    fnum = fnum + 1;
    fname = sprintf('testcase%d.txt',fnum);
    fname2 = sprintf('golden%d.txt',fnum);
    if (~exist(fname,'file'))
       break;
    end
end
o1 = fopen(fname,'w');
o2 = fopen(fname2,'w');

m = randi(MAX_M);
n = randi(MAX_N);
k = randi(MAX_K);

a = zeros(m,k);
for i = 1:1:m
    for j = 1:1:k
        a(i,j) = randi([MIN_AB_VAL,MAX_AB_VAL]);
    end
end
b = zeros(k,n);
for i = 1:1:k
    for j = 1:1:n
        b(i,j) = randi([MIN_AB_VAL,MAX_AB_VAL]);
    end
end
c = a*b;

fprintf(o1,'%d %d %d\n',m*k,m,k);
for i = 1:1:m
    for j = 1:1:k
        if (j == k)
            fprintf(o1,'%d\n',a(i,j));
        else
            fprintf(o1,'%d ',a(i,j));
        end
    end
end
fprintf(o1,'\n');
fprintf(o1,'%d %d %d\n',k*n,k,n);
for i = 1:1:k
    for j = 1:1:n
        if (j == n)
            fprintf(o1,'%d\n',b(i,j));
        else
            fprintf(o1,'%d ',b(i,j));
        end
    end
end

fprintf(o2,'%d %d %d\n',m*n,m,n);
for i = 1:1:m
    for j = 1:1:n
        if (j == n)
            fprintf(o2,'%d\n',c(i,j));
        else
            fprintf(o2,'%d ',c(i,j));
        end
    end
end

fclose(o1);
fclose(o2);