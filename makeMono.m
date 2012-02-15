function monoData = makeMono(d,k)

seed1 = [0,0,0,0,0];
seed2 = [1,0,0,0,0];
seed3 = [1,1,0,0,0];
seed4 = [2,0,0,0,0];
seed5 = [k,0,0,0,0];
seed6 = [1,k-2,0,0,0];


p1 = perm(seed2);
p2 = perm(seed3);
p3 = perm(seed4);

u1 = getUniqueMatrixVersion2(p1);
u2 = getUniqueMatrixVersion2(p2);
u3 = getUniqueMatrixVersion2(p3);

[a b] = size(u1);
[c d] = size(u2);
[e f] = size(u3);
g = a + c + e;

monoData = zeros(g+1,5);

end