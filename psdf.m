
clear
load('inertia','S','D','len','V')

%S is 1x184 matrix indicating the cg of several element

%% sea spectrum
g = 9.81;
f = [];
A = [];
K = [];
Sa = [];
f(1) = 0;     %rad/s , frequency
A(1) = pmspectra(f(1));
Sa(1) = pmspectra(f(1))/(10.^4);
K(1) = f(1)/sqrt(g*141.5) ;  %wave number considering the shallow water condition
for j = 1:199
    f(j+1) = f(j)+0.01;
    A(j+1) = sqrt(2*pmspectra(f(j+1))*0.01/(10.^4));
    K(j+1) = f(j+1)/sqrt(g*141.5);
    Sa(j+1) = pmspectra(f(j+1))/(10.^4);
end


phi = 0 + (6.28 - 0)*rand(1,1000); %need to store values


%% water particle velocity spectrum
Sw = [];   %144x200 matrix , outer loop:for each element , inner loop:for each frequency of 0.01 rad/sec interval
Sw(:,1) = 0;
for i = 1:144
    for j = 2:200
    q = 0;
    q = q + (cosh(K(j)*S(i))/sinh(K(j)*141.5))*(cosh(K(j)*S(i))/sinh(K(j)*141.5))*f(j)*f(j)*Sa(j);
    Sw(i,j) = q;
    end
end

plot(f,Sw)
clear i j
sigmau = [];
for j = 1:144
sigmau(j) = trapz(Sw(:,j));  % calculating area under the Sw curve:1X144
end
clear i j
% for i = 1:144
%     for j = 2:200
%     q1 = 0;
%     q1 = q1+G0(i,j)*G0(i,j)*f(j)*f(j)*Sa(j);
%     Sw(i,j) = q1;
%     end
% end

%clear i j 

%% a1 , a1 , a3 spectrum
G1 = [];
G2 = [];
G3 = [];
G1(1) = 0;
G2(1) = 0;
G3(1) = 0;
for i = 2:200
    su = 0;
    SU = 0;
    Suu = 0;
    Suuu = 0;
    for j = 1:144
    su = su + (cosh(K(i)*S(j))/sinh(K(i)*141.5))*D(j)*S(j)*S(j)*len(j);
    SU = SU + (cosh(K(i)*S(j))/sinh(K(i)*141.5))*V(j)*S(j)*len(j);
    Suu = Suu + (cosh(K(i)*S(j))/sinh(K(i)*141.5))*D(j)*sigmau(j)*sqrt(8/pi)*S(j)*len(j);
    end
    G1(i)= su;
    G2(i) = Suu;
    G3(i)= SU;
end

Sa1 = [];
Sa1(1) = 0;
Sa2 = [];
Sa2(1) = 0;
Sa3 = [];
Sa3(1) = 0;

for m = 2:200
   q = 0;
   q3 = 0;
   q2 = 0;
  
   q = q + G1(m)*G1(m)*f(m)*f(m)*Sa(m);
   q2 = q2+ G3(m)*G3(m)*f(m)*f(m)*f(m)*f(m)*Sa(m);
   q3 = q3 + G2(m)*G2(m)*f(m)*f(m)*Sa(m);
   
   Sa1(m) = q;
   Sa2(m) = q2;
   Sa3(m) = q3;
 
end
% disp(Saa);
%plot(f,Sa3);


save('psdfvariables','Sa1','Sa2','Sa3','f','Sw');                                                                      
%% peirson moskowitz spectra
function a = pmspectra(x)
  g = 981;
  alpha = 0.0081;
  Vw = 2733;
  a = alpha*g*g*exp(-0.74*(x*Vw/g)^-4)/(x^5); % pm spectral function
end