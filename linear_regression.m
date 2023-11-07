x= 1:1:7;
l1=length(x);
y= [0.5,2.5,2.0,4.0,3.5,6.0,5.5];
s1=0;
for i=1:l1
    s1=s1+x(i);
end
s2=0;s3=0;s4=0;
for i=1:l1
    s2=s2+y(i);
    s3=s3+x(i)^2;
    s4=s4+x(i)*y(i);
end

b=(l1*s4-(s1*s2))/(l1*s3-s1^2);
a=s2/l1-b*(s1/l1);
scatter(x,y)  % draw only point
hold on
y1 = a+b*x; % linear regression model

plot(x,y1);
title('Linear Regression Model','color','r');
xlabel(' X axis 1 <= x <= 7','color','m') ;
ylabel(' Y axis 0.5<=y<=5.5','color','b') ;
legend({'given data','Model'},'Location','Northeast')
% sum= sum+sin(x(i));
%y1=[0,0,0,0,0,0,0];
for i=1:1:l1
    y1(i)=a+b*x(i);
    e =abs(y(i)-y1(i));
    fprintf("error at data %d:%f\n",i,e);
end
   st=0;   % variance with respect data
   sr=0;     % variance with respect to model
y_avg=s2/7;

for i=1:1:l1
    st=st+(y(i)-y_avg)^2;
    sr=sr+(y(i)-y1(i))^2;
end
 
 fprintf("variance with respect data:%f\n",st);
 fprintf("variance with respect model:%f\n",sr);

sy=(st/(l1-1))^1/2;         % standard deviation with respect data 
sm= (sr/(l1-2))^1/2;     % standard deviation with respect to model
r2=(st-sr)/st;
fprintf("standard deviation with respect to given data:%f\n",sy);
fprintf("standard deviation with respect to given model:%f\n",sm);
fprintf("r2:%f\n",r2);
