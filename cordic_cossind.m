function [cosd,sind] = cordic_cossind(angle_d)
%CORDICTAN Summary of this function goes here
%   Detailed explanation goes here

if angle_d>=180
    angle_d=angle_d-360*(floor((angle_d+180)/360));
elseif angle_d<-180
    angle_d=angle_d+360*(-floor(angle_d/360));
end

angles_alpha_d=[90 atand(1./(2.^(0:22)))];
angle_cmp=0;
directions=zeros(1,24);
for i=1:24
    if (angle_d>=angle_cmp)
        angle_cmp=angle_cmp+angles_alpha_d(i);
        directions(i)=1;
    else
        angle_cmp=angle_cmp-angles_alpha_d(i);
        directions(i)=-1;
    end
end

if directions(1)==1
    prevQ=1;
    prevI=0;
else
    prevQ=-1;
    prevI=0;
end

for i=2:24
    nextQ=prevQ+directions(i)*2^(-i+2)*prevI;
    nextI=prevI-directions(i)*2^(-i+2)*prevQ;
    prevQ=nextQ;
    prevI=nextI;
end
%K=1.6468;
K=prod(sqrt(1+2.^(-2*(0:22))));
cosd=prevQ/K;
sind=prevI/K;
end

