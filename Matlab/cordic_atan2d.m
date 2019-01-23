function [angle_d, directions] = cordic_atan2d(Q,I)
%CORDIC Summary of this function goes here
%   Q:Imaginary part
%   I:Real part
    directions=zeros(1,24);
    prevQ=Q;
    prevI=I;
    if (Q<0)&&(I>0) % FPGA: Only Check sign bit
        nextQ=prevI;
        nextI=-prevQ;
        directions(1)=1; % cadran bas droite
    elseif (Q>=0)&&(I<0)
        nextQ=-prevI;
        nextI=prevQ;
        directions(1)=-1; % cadran haut gauche
    elseif (Q<0)&&(I<=0)
        nextQ=prevI;
        nextI=-prevQ;
        directions(1)=1; % cadran bas gauche
    else
        nextQ=-prevI;
        nextI=prevQ;
        directions(1)=-1; % cadran haut droite
    end
    angles_alpha_d=[90 atand(1./(2.^(0:22)))];
    %angles_alpha_d=[90 45 26.5651 14.0362 7.1250 3.7563 1.7899 0.8952 0.4476 0.2238 0.1119 0.0560 0.0280 0.0140]; %precalculees
    
    prevQ=nextQ;
    prevI=nextI;
    
    for i=1:23
        Q1=prevQ+2^(-i+1)*prevI;
        Q2=prevQ-2^(-i+1)*prevI;
        dist1=abs(Q1);
        dist2=abs(Q2);
        if dist1<=dist2
            directions(1+i)=1;
            nextQ=Q1;
            nextI=prevI-2^(-i+1)*prevQ;
        else
            directions(1+i)=-1;
            nextQ=Q2;
            nextI=prevI+2^(-i+1)*prevQ;
        end
        prevI=nextI;
        prevQ=nextQ;
    end
    angle_d=sum(-directions.*angles_alpha_d);
    %K=1.6468; %precalculee K=prod(sqrt(1+2.^(-2*[0:22])));
end
