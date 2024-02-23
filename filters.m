%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%%%% %%%%%  %        %%%%%  %%%%  %%%%
 %              %       %             %      %         %     %
 %%%%%     %       %             %      %%%%  %%%%      
 %              %       %             %      %         %     %
 %         %%%%%   %%%%%    %      %%%%  %     % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc;
%LP filter
ws=input('enter the normalized cut off frequency');
wp=input('enter the normalized pass frequency');
Ap=input('enter the attenuation in pass band ');
As=input('enter the attenuation in stop band');
[N,wc]=buttord(wp,ws,Ap,As);
[z,p,k] = buttap(N);
[nem,den]=zp2tf(z,p,k);
[nem,den]=lp2lp(nem,den,wc*pi);
freqs(nem,den);
[b,a]=bilinear(nem,den,1);
freqz(b,a);
%%
%HP filter
ws=input('enter the normalized cut off frequency');
wp=input('enter the normalized pass frequency');
Ap=input('enter the attenuation in pass band ');
As=input('enter the attenuation in stop band');
[N,wc]=buttord(wp,ws,Ap,As);
[z,p,k] = buttap(N);
[nem,den]=zp2tf(z,p,k);
W=2*tan(wc*pi/2);%unwrapping to analog frequency
[nem_,den_]=lp2hp(nem,den,W);
figure('Name','normalized LP');
freqs(nem,den);
[b,a]=bilinear(nem_,den_,1);
figure('Name','Digital BW filter');
freqz(b,a);
%%
clear all;
clc;
%BP filter
%lower stop band edge wsl=0.1pi
%lower pass band edge wpl=0.4pi
%upper pass band edge wpl=0.6pi
%upper stop band edge wpl=0.9pi
%pass band attenuation Ap=3dB
%stop band attenuation Ap=18dB
wp=[0.4 ,0.6];
ws=[0.1,0.9];
Ap=3;
As=18;
[N,wc]=buttord(wp,ws,Ap,As);
%unwrapping to analog frequency
Wc=2*tan(wc*pi/2);
[z,p,k] = buttap(N);
[nem,den]=zp2tf(z,p,k);
w0=(Wc(1)+Wc(2))/2;%center frequency
BW=abs(Wc(1)-Wc(2));%Bandwidth
[nem_,den_]=lp2bp(nem,den,w0,BW);
figure('Name','normalized LP');
freqs(nem,den);
[b,a]=bilinear(nem_,den_,1);
figure('Name','Digital BW filter');
freqz(b,a);