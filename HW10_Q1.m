A = [-3.602, -0.822; 0.822, -0.593];
B = [-1; 0.107];
C = [-1, -0.107];
D = 0;
sysp = ss(A, B, C, D);

P = ctrb(sysp)
Q = obsv(sysp)

At = [0 C; 0*B A];
Bt = [0; B];
Ct = [0, C];
syst = ss(At, Bt, Ct, D);

p = [-3, -2-2i, -2+2i];
Kt = place(At, Bt, p)

% State variable feedback block syssvf
K=Kt(2:3);
syssvf = ss(A-B*K, B, C, D);
% I-action block sysi:
sysi=ss(0, Kt(1,1), 1, 0);
% open-loop block syso:
syso = syssvf*sysi;
% closed-loop system syscl
syscl = feedback(syso,1);
% Check closed-loop eigenvalues
[acl,bcl,ccl,dcl] = ssdata(syscl);
eig(acl)
% step response
step(syscl)

% Find the zeros of the system
z = zero(syscl);
% Find the poles of the system
p = pole(syscl);
% Display the zeros and poles
disp('Zeros of the system:');
disp(z);
disp('Poles of the system:');
disp(p);

