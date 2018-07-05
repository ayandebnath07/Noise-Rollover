clc;
close all;
fs=12000;
f=8000;
t=0:(1/fs):5;

%Enter the input%
v=audiorecorder;
disp('Start Speaking');
recordblocking(v,5); %(signal, timedelay)
disp('End of recording');
play(v);
pause(7);
disp('Noise');
x=sin(2*pi*f*t);
v1=getaudiodata(v);
sound(x);
pause(7);
a=x(:,1:40000);
y=a'+v1;
sound(y);
q=pwelch(x);
plot(q);
%{
sound(a);
pause(7);
sound(a');
%}
disp('Output');

%Using equiripple  with cutoff between 4000 to 5000 Hz%
pause(7);
disp('Equiripple Method output');
p1=conv(y,Num_eqi);
sound(p1);
plot(p1);
pxx1=pwelch(p1);
plot(pxx1);

%Using least square  with cutoff between 4000 to 5000 Hz%
pause(7);
disp('Equiripple Least square Method output');
p2=conv(y,Num_lestsq);
sound(p2);
plot(p2);
pxx2=pwelch(p2);
plot(pxx2);

%Using window method with cutoff between 4000 to 5000 Hz%
pause(7);
disp('Window Method output');
p3=conv(y,Num_win);
sound(p3);
plot(p3);
pxx3=pwelch(p3);
plot(pxx3);


%Using constant lest square method with cutoff between 4000 to 5000 Hz%
pause(7);
disp('Const. Least Square Method output');
p4=conv(y,Num_cnstlstsq);
sound(p4);
plot(p4);
pxx4=pwelch(p4);
plot(pxx4);