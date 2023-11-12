clear
load('psdfvariables','Sa1','Sa2','Sa3','f', 'Sw')

%% inverted fourier transform
df=0.01;
% ap = [];
% ap(1) = 0;
% for j = 2:200
% ap(j) = sqrt(2.*Sa1(j).*df);
% end
% %random number form -pi to pi    
% epsilon=-pi + 2*pi*rand(1,length(ap));
% %transform to time series
% randomSeries=300000.*real(ifft(ap.*exp(epsilon.*i.*2.*pi),300000));
% %Add the mean value
phi = 0 + (6.28 - 0)*rand(1,200);
p1 = [];
p2 = [];
p3 = [];
u = [];
t = 0.01:0.01:3000;
%% a1 
ap = [];
for i = 1:200
    ap(i) = sqrt(2.*Sa1(i).*df);
end
for k = 1:1:300000
    sum = 0;
    for i = 1:200
        sum = sum + ap(i)*cos(f(i)*t(k)+phi(i));
    end
    p1(k) = sum;
end
%% a2
ap1 = [];
for i = 1:200
    ap1(i) = sqrt(2.*Sa2(i).*df);
end
for k = 1:1:300000
    sum = 0;
    for i = 1:200
        sum = sum + ap1(i)*cos(f(i)*t(k)+phi(i));
    end
    p2(k) = sum;
end

%% a3
ap2 = [];
for i = 1:200
    ap2(i) = sqrt(2.*Sa3(i).*df);
end
for k = 1:1:300000
    sum = 0;
    for i = 1:200
        sum = sum + ap2(i)*cos(f(i)*t(k)+phi(i));
    end
    p3(k) = sum;
end
%% u
% apu = [];
% for ii = 1:144
%     for i = 1:200
%     apu(i) = sqrt(2.*Sw(ii,i).*df);
%     end
%     for k = 1:1:300000
%     sum = 0;
%     for i = 1:200
%         sum = sum + apu(i)*cos(f(i)*t(k)+phi(i));
%     end
%     u(ii,k) = sum;
%     end
% end





save('timeseriesv', 'u','t');