clc;clear;
thv=0/180*pi;
ip0=29.9;
zn=0.367;
ilim=41;
vn0=311*0.1;
vp=311*0.85;
thz=33/180*pi;
dp=8000;
i=0;h=5;k=1;

for thia=-180:0.5:180
thi=thia/180*pi;
i=i+1;

%0<=thia<=60已修改全部
if (thia>=0)&&(thia<=60)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=2*ip2*zn*(tan(thi))^2;
c2=(ip2*zn*tan(thi))^2-(ilim*zn)^2; 
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;

 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0   
a2=1+(tan(thi))^2;
b2=2*ip2*zn*(tan(thi))^2;
c2=(ip2*zn*tan(thi))^2-(ilim*zn)^2; 
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
X2=x2+(ip2-ip0)*zn;
Y2=y2;
  else
B=(-sqrt(3)/2*ip2+0.5*tan(thi)*ip2)*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn+sqrt(3)/2*ip2)^2);
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=-sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2+sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%60<=thia<90已修改全部
if (thia>60)&&(thia<90)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=3*ip2*zn+2*ip2*zn*(tan(thi))^2-tan(thi)*sqrt(3)*ip2*zn;
c2=(1.5*ip2*zn)^2+(sqrt(3)/2*ip2*zn-ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;

 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
B=zn*((sqrt(3)/2*ip2-sqrt(3)/2*ip0)+tan(thi)*(-1.5*ip0+0.5*ip2));
a2=1+(tan(thi))^2;
b2=3*ip0*zn+2*tan(thi)*(-B)-tan(thi)*sqrt(3)*ip0*zn;
c2=(1.5*ip0*zn)^2+(sqrt(3)/2*ip0*zn+B)^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(ip2-ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(ip2-ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2-sqrt(3)/2*(ip2-ip0)*zn;
  else
B=(-sqrt(3)/2*ip2+0.5*tan(thi)*ip2)*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=-sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2+sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%thia=90已修改全部
if (thia==90)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
x2=-ip2*zn;
b2=sqrt(3)*ip2*zn;
c2=(ip2^2-ilim^2)*zn^2;
y2=(-b2+sqrt(b2^2-4*c2))/2;
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
x2=(-1.5*ip0+0.5*ip2)*zn;
b2=sqrt(3)*ip0*zn;
c2=(0.25*ip2^2+0.75*ip0^2-ilim^2)*zn^2;
y2=(-b2+sqrt(b2^2-4*c2))/2;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(ip2-ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(ip2-ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2-sqrt(3)/2*(ip2-ip0)*zn;
  else
x2=0.5*ip2*zn;
y2=sqrt(ilim^2-(0.5*ip2)^2)*zn; 
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=-sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2+sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%90<thia<=120已修改全部
if (thia>90)&&(thia<=120)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=3*ip2*zn+2*ip2*zn*(tan(thi))^2-tan(thi)*sqrt(3)*ip2*zn;
c2=(1.5*ip2*zn)^2+(sqrt(3)/2*ip2*zn-ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
B=zn*((sqrt(3)/2*ip2-sqrt(3)/2*ip0)+tan(thi)*(-1.5*ip0+0.5*ip2));
a2=1+(tan(thi))^2;
b2=3*ip0*zn+2*tan(thi)*(-B)-tan(thi)*sqrt(3)*ip0*zn;
c2=(1.5*ip0*zn)^2+(sqrt(3)/2*ip0*zn+B)^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(ip2-ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(ip2-ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2-sqrt(3)/2*(ip2-ip0)*zn;
  else
B=(-sqrt(3)/2*ip2+0.5*tan(thi)*ip2)*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=-sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2+sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%120<thia<=180已修改全部
if (thia>120)&&(thia<=180)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);    
a2=1+(tan(thi))^2;
b2=3*ip2*zn+2*ip2*zn*(tan(thi))^2-tan(thi)*sqrt(3)*ip2*zn;
c2=(1.5*ip2*zn)^2+(sqrt(3)/2*ip2*zn-ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
B=zn*((sqrt(3)/2*ip2-sqrt(3)/2*ip0)+tan(thi)*(-1.5*ip0+0.5*ip2));
a2=1+(tan(thi))^2;
b2=3*ip0*zn+2*tan(thi)*(-B)-tan(thi)*sqrt(3)*ip0*zn;
c2=(1.5*ip0*zn)^2+(sqrt(3)/2*ip0*zn+B)^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(ip2-ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(ip2-ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2-sqrt(3)/2*(ip2-ip0)*zn;
  else
B=-tan(thi)*ip2*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
X2=x2+(-ip0+ip2)*zn;
Y2=y2;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%-60=<thia<0已修改全部
if (thia>=-60)&&(thia<0)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=2*ip2*zn*(tan(thi))^2;
c2=(ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1; 
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
a2=1+(tan(thi))^2;
b2=2*ip2*zn*(tan(thi))^2;
c2=(ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
X2=x2+(ip2-ip0)*zn;
Y2=y2;
  else
B=(sqrt(3)/2*ip2+0.5*tan(thi)*ip2)*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);  
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2-sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%-90<thia<60已修改全部
if (thia>-90)&&(thia<-60)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=3*ip2*zn+2*ip2*zn*(tan(thi))^2+tan(thi)*sqrt(3)*ip2*zn;
c2=(1.5*ip2*zn)^2+(-sqrt(3)/2*ip2*zn-ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
B=zn*(-sqrt(3)/2*ip2+sqrt(3)/2*ip0+tan(thi)*(-1.5*ip0+0.5*ip2));
a2=1+(tan(thi))^2;
b2=3*ip0*zn+2*tan(thi)*(-B)+tan(thi)*sqrt(3)*ip0*zn;
c2=(1.5*ip0*zn)^2+(-sqrt(3)/2*ip0*zn+B)^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(-ip2+ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(-ip2+ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2+sqrt(3)/2*(ip2-ip0)*zn;
  else
B=(sqrt(3)/2*ip2+0.5*tan(thi)*ip2)*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2-sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);  
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2-sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%thia=-90已修改全部
if (thia==-90)
ip2=ip0; 
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
x2=-ip2*zn;
b2=-sqrt(3)*ip2*zn;
c2=(ip2^2-ilim^2)*zn^2;
y2=(-b2-sqrt(b2^2-4*c2))/2;
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1;
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);  
  if ip2>=0    
x2=(-1.5*ip0+0.5*ip2)*zn;
b2=-sqrt(3)*ip0*zn;
c2=(0.25*ip2^2+0.75*ip0^2-ilim^2)*zn^2;
y2=(-b2-sqrt(b2^2-4*c2))/2;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(-ip2+ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(-ip2+ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2+sqrt(3)/2*(ip2-ip0)*zn;
  else
x2=0.5*ip2*zn;
y2=-sqrt(ilim^2-(0.5*ip2)^2)*zn;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);  
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2-sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%-120=<thia<90已修改全部
if (thia>=-120)&&(thia<-90)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=3*ip2*zn+2*ip2*zn*(tan(thi))^2+tan(thi)*sqrt(3)*ip2*zn;
c2=(1.5*ip2*zn)^2+(-sqrt(3)/2*ip2*zn-ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1; 
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
B=zn*(-sqrt(3)/2*ip2+sqrt(3)/2*ip0+tan(thi)*(-1.5*ip0+0.5*ip2));
a2=1+(tan(thi))^2;
b2=3*ip0*zn+2*tan(thi)*(-B)+tan(thi)*sqrt(3)*ip0*zn;
c2=(1.5*ip0*zn)^2+(-sqrt(3)/2*ip0*zn+B)^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(-ip2+ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(-ip2+ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2+sqrt(3)/2*(ip2-ip0)*zn;
  else
B=(sqrt(3)/2*ip2+0.5*tan(thi)*ip2)*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn-0.5*ip2)^2+(y2/zn-sqrt(3)/2*ip2)^2);  
    if in>inmax
    x2=0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*ip2*zn+sin(thi)*inmax*zn;
    end
X2=x2+(-ip0-0.5*ip2)*zn;
Y2=y2-sqrt(3)/2*ip2*zn;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

%-180=<thia<120已修改全部
if (thia>=-180)&&(thia<-120)
ip2=ip0;
thv2=thv;thev=thv2+thz+pi;
ap=vp^2;bp=2*vn0*ip2*vp*cos(thev-thi);cp=vn0^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
a2=1+(tan(thi))^2;
b2=3*ip2*zn+2*ip2*zn*(tan(thi))^2+tan(thi)*sqrt(3)*ip2*zn;
c2=(1.5*ip2*zn)^2+(-sqrt(3)/2*ip2*zn-ip2*zn*tan(thi))^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2-ip2*zn*tan(thi);
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);  
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
  x1=x2;y1=y2;X2=x2;Y2=y2;
vn1=sqrt((x2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-y2)^2);vn2=vn1;
p1=(x2+vn0*cos(thv)+ip0*zn)*(-x2/zn-ip0)+(vn0*sin(thv)-y2)*y2/zn;p=p1; 
 for j=1:1:h
thv2=atan((vn0*sin(thv)-Y2)/(X2+vn0*cos(thv)+ip0*zn));thev=thv2+thz+pi;
p=p*cos(thv2+thz-thi)/cos(thv2-thi);
ip2=ip0+k*p/vp;
ap=vp^2;bp=2*vn2*ip2*vp*cos(thev-thi);cp=vn2^2*ip2^2-dp^2;
inmax=(-bp+sqrt(bp^2-4*ap*cp))/(2*ap);
  if ip2>=0
B=zn*(-sqrt(3)/2*ip2+sqrt(3)/2*ip0+tan(thi)*(-1.5*ip0+0.5*ip2));
a2=1+(tan(thi))^2;
b2=3*ip0*zn+2*tan(thi)*(-B)+tan(thi)*sqrt(3)*ip0*zn;
c2=(1.5*ip0*zn)^2+(-sqrt(3)/2*ip0*zn+B)^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+1.5*ip0-0.5*ip2)^2+(y2/zn-sqrt(3)/2*(-ip2+ip0))^2);
    if in>inmax
    x2=-1.5*ip0*zn+0.5*ip2*zn-cos(thi)*inmax*zn;
    y2=sqrt(3)/2*(-ip2+ip0)*zn+sin(thi)*inmax*zn;
    end
X2=x2-0.5*(ip2-ip0)*zn;
Y2=y2+sqrt(3)/2*(ip2-ip0)*zn;
  else
B=-tan(thi)*ip2*zn;
a2=1+(tan(thi))^2;
b2=-2*tan(thi)*B;
c2=B^2-(ilim*zn)^2;
x2=(-b2+sqrt(b2^2-4*a2*c2))/(2*a2);
y2=-tan(thi)*x2+B;
    in=sqrt((x2/zn+ip2)^2+(y2/zn)^2);
    if in>inmax
    x2=-ip2*zn-cos(thi)*inmax*zn;
    y2=sin(thi)*inmax*zn;
    end
X2=x2+(-ip0+ip2)*zn;
Y2=y2;
  end
vn2=sqrt((X2+vn0*cos(thv)+ip0*zn)^2+(vn0*sin(thv)-Y2)^2);  
p2=(X2+vn0*cos(thv)+ip0*zn)*(-X2/zn-ip0)+(vn0*sin(thv)-Y2)*Y2/zn;p=p2;
 end
xn=X2;yn=Y2;
end

A(1,:)=[x1 y1 xn yn vn1 vn2 p2 ip2 thi];
b(i,:)=A(1,:);
end
x=b(:,1);
y=b(:,2);
xn=b(:,3);
yn=b(:,4);
vn=b(:,6);
thi=4/3*pi-b(:,9);
if thi>(2*pi)
    thi=thi-2*pi;
end
%不考虑负序功率
  plot(x,y,'--','LineWidth',1.3);
   hold on
%考虑负序功率
  plot(xn,yn,'LineWidth',1);
   hold on
%负序电压大小变化
   plot(thi,vn/311,'LineWidth',1)
%    hold on
xlim([-20,20]);ylim([-20,20]);
xticks(-20:2:20);yticks(-20:2:20);
% xticks(1/3*pi:pi/2:7/3*pi);yticks(-1:0.005:1);
set(gca,'linewidth',0.7);
set(gca,'fontsize',14,'FontWeight','bold','fontname','Times New Roman');
grid on
