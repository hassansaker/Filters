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
