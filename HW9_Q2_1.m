A = [0,2,0,0;0,0,4,0;0,0,0,8;-1.557,-4.803,-9.37,-14.6];
B = [0;0;0;2];
C = [0.2031,0.5625,0.6875,0.5];
D = 0;

sys = ss(A, B, C, D);
[sysb,g,TL,TR] = balreal(sys)
% h_sys = ss2tf(A, B, C, D)

Ab = sysb.A
Bb = sysb.B
Cb = sysb.C
Db = sysb.D;

Wbc = lyap(Ab, Bb*Bb')
Wbo = lyap(Ab', Cb'*Cb)

elim = (g < 1e-2);
sysR1 = modred(sysb,elim);
% h_sysR2 = ss2tf(sysR2.A, sysR2.B, sysR2.C, sysR2.D);

% hmdc = modred(sysb, elim, 'MatchDC');
% hdel = modred(sysb, elim, 'Truncate');

% bode(sys, sysR1)

% step(sys)
step(sysR1)