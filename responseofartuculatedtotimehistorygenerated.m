

%% response of Articulated tower 


clear
load hs_16 
%loading the time history of excitation for 16m significant height

p1=p1*((100*0.6)/1.057e+10);                   % final excitation "a1"
p2=p2*((100*0.6)/(2*1.057e+10));                % final excitation "a2"   
p3=p3*((100*2)/1.057e+10);                       % final excitation "a3"  

kdo=2.47e+10;
I0=1.057e+10;
n=0.05;

% using newmarks beta method to solve single degree of freedom articulated
% tower
h = 141.5;
% k1 = 400000; %R*GM; %restoring coefficeint
% k11 =40000; %linear spring coefficient
% k13 = 5; %non linear spring coefficient
% k2 = k1 + k11*h^2;
% k3 = (-2*k11*h^2/3)-(k1/6)+(k13*h^4);
% 
% %% restoring component of equation of motion 
% 
% syms g(theta)
% g(theta) = piecewise(theta<0, k2*theta/I0 + k3*theta^3/I0, theta>0, k1*(theta - theta^3/6)/I0,0);
% % disp(g(2));
% % disp(g(1));
% %fplot(g(theta));
% x1 = -0.6:0.01:0.6;
% for i = 1:1:121
%      g1(i) = g(x1(i));
% end
% %plot(x1,g1);
% fr = polyfit(x1,single(g1),3);
% % disp(fr);
% 
% c0 = fr(4);
% c3 = fr(1);
% c2 = fr(2);
% c1 = fr(3); 

%% external load 
%B = 1;
ws = 0.11;


%% using newmarks beta method to solve single degree of freedom articulated tower
beta=1/6;
gama=1/2;
dt=0.01;
x(1)=0;
xd(1)=0;
xdd(1)=(-p2(1)+p3(1));
tx1=x(1);
txd1=xd(1);
txdd1=xdd(1);
tp=-p2(1)+p3(1);
ks=(1/(beta*dt^2))+(gama/(beta*dt))*2*n*ws+ws^2;
a=(1/(beta*dt))+(gama/beta)*2*n*ws;
b=1/(2*beta)+dt*((gama/(2*beta))-1)*2*n*ws;
for i=1:1:300000-1;
    dp(i)=-p2(i+1)+p3(i+1)+p2(i)-p3(i);
    dps(i)=dp(i)+a*xd(i)+b*xdd(i);
    dx(i)=dps(i)/ks;
    dxd(i)=(gama/(beta*dt))*dx(i)-(gama/beta)*xd(i)+dt*(1-gama/(2*beta))*xdd(i);
    dxdd(i)=(1/(beta*dt^2))*dx(i)-(1/(beta*dt))*xd(i)-(1/(2*beta))*xdd(i);
    x(i+1)=x(i)+dx(i);
    xd(i+1)=xd(i)+dxd(i);
    xdd(i+1)=xdd(i)+dxdd(i);
    tt1=1;
    tx=x(i+1);
    txd11=xd(i+1);
    txd=txd1;
    txdd=txdd1;
    while (tt1>0.00000001||tt2>0.00000001) % iteration for handling nonlinearity
        tx11=tx; 
        txd22=txd11;
        tdp=(-p2(i+1)+p3(i+1)+(p1(i+1))*abs(txd11)-(kdo/I0)*txd11*abs(txd11)-(ws*ws)*(tx^3))-tp;
        tdps=tdp+a*txd+b*txdd;
        tdx=tdps/ks;
        tdxd=(gama/(beta*dt))*tdx-(gama/beta)*txd+dt*(1-gama/(2*beta))*txdd;
        tdxdd=(1/(beta*dt^2))*tdx-(1/(beta*dt))*txd-(1/(2*beta))*txdd;
        tx=tx1+tdx;
        txd11=txd1+tdxd;
        tt1=abs((tx-tx11)/tx11);
        tt2=abs((txd11-txd22)/txd22);
%       tt1=(abs(tx)-abs(tx11))/abs(tx11);
    end
    tp=-p2(i+1)+p3(i+1)+(p1(i+1))*abs(txd11)-(kdo/I0)*txd11*abs(txd11)-(ws*ws)*(tx^3);
    txd=txd1+tdxd;
    txdd=txdd1+tdxdd;
    tx1=tx;
    txd1=txd;
    txdd1=txdd;
    x(i+1)=tx; % final angular displacement of articulated tower
    xd(i+1)=txd; % final angular velocity of articulated tower
    xdd(i+1)=txdd; % final angular acceleration of articulated tower
end
plot(t,xdd);
%save('fpsoresponsesrandom','t','x','xd','xdd')
% 
% disp(dt);
% plot(x,xd);
% lc = lyapunovExponent(x(1:500),100);
% disp(lc);
%save finalresponse\h_21_dt_0p01_PSDF\3_b_s t x xd xdd
% clear I* a* b* d* g* i* k* n td* tp* tt* tx* ws p*
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = 0.01:0.01:3000;
plot(x)
% save('rFINAL5','t','x','xd','xdd','k1','k13','c1','c2','c3')
save('SDOFALPNMFINAL','t','x','xd','xdd');
% save('sdofresponsessir','t','x','xd','xdd')












%% Probability density function of angular displacement of articulated tower
% load finalresponse\h_21_dt_0p01_PSDF\3_b_s
% w0=0.11;
% for i=1:1:300000;
%     ca=(w0^2)/4;
%     cb=(w0^2)/2;
%     cc=((w0^2)/2)*(x(i)^2)+((w0^2)/4)*(x(i)^4)+(1/2)*(xd(i)^2);
%     f1=sqrt(cb^2+4*ca*cc);
%     a1(i)=sqrt((-cb+f1)/(2*ca));
% end   
% i=0;
% for i1=0.01:0.01:5;
%     i=i+1;
%     i2=i1+0.01;
%     i4=0;
%     for i3=1:1:300000;
%         if(a1(i3)>=i1&&a1(i3)<i2)
%             i4=i4+1;
%         end
%     end
%     pa1(i)=(i4/300000)/0.01;    % final probability density function of angular displacement
% end
% i1=0.01:0.01:5;                 % x-axis of probability density function (angular displacement)
% 
% 
% plot(i1,pa1);   % plot of PDF of angular displacement
% 
% clear  c* f* i i2 i3 i4 t w0 x xd xdd