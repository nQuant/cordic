angles_d_init=-300:5:480;
Q1=sind(angles_d_init);
I1=cosd(angles_d_init);
xsi=zeros(length(angles_d_init),24);
angles_d_testvalue=zeros(1,length(angles_d_init));
for i=1:length(angles_d_init)
    [angles_d_testvalue(i),xsi(i,:)]=cordic_atan2d(Q1(i),I1(i));
end

figure
plot(angles_d_init,angles_d_testvalue,'-x')
xlabel("angle en entrée")
ylabel("angle en sortie")
title("test calcul d'arc-tangente avec Cordic")

%%
angles_d_init=-300:5:480;
Q2=zeros(1,length(angles_d_init));
I2=zeros(1,length(angles_d_init));
for i=1:length(angles_d_init)
    [Q2(i),I2(i)]=cordic_cossind(angles_d_init(i));
end

figure
plot(angles_d_init,I1,angles_d_init,I2,angles_d_init,Q1,angles_d_init,Q2)
xlabel("angle en entrée")
ylabel("Composantes I et Q")
title("Test calcul de cosinus et de sinus avec Cordic")
%[angles_d_init;I1;I2;Q1;Q2]
