%Group name: Image-in That
%Authors: George Rassam, Kylie Gilmet, Javier Quiros

clc; clear;

%have the user input 4 images, the long axis and short axis views of the
%heart before and after contraction.
MR_SA_SYS=input('Input the systolic short axis MRI: ','s');
MR_SA_SYS=imread(MR_SA_SYS);

MR_LA_SYS=input('Input the systolic long axis MRI: ','s');
MR_LA_SYS=imread(MR_LA_SYS);

MR_SA_DIA=input('Input the diastolic short axis MRI: ','s');
MR_SA_DIA=imread(MR_SA_DIA);

MR_LA_DIA=input('Input the diastolic long axis MRI: ','s');
MR_LA_DIA=imread(MR_LA_DIA);

%convert all values to gray
MR_SA_SYS=rgb2gray(MR_SA_SYS);

MR_LA_SYS=rgb2gray(MR_LA_SYS);

MR_SA_DIA=rgb2gray(MR_SA_DIA);

MR_LA_DIA=rgb2gray(MR_LA_DIA);

%make all images binary
MR_SA_SYS = MR_SA_SYS > 115;

MR_LA_SYS = MR_LA_SYS > 115;

MR_SA_DIA = MR_SA_DIA > 115;

MR_LA_DIA = MR_LA_DIA > 115;

%count the pixels
pix_MR_SA_SYS=length((find(MR_SA_SYS==1)));

pix_MR_LA_SYS=length((find(MR_LA_SYS==1)));

pix_MR_SA_DIA=length((find(MR_SA_DIA==1)));

pix_MR_LA_DIA=length((find(MR_LA_DIA==1)));

%calculate the radius of the LV using the short axis area
Area_SYS=round(sqrt((pix_MR_SA_SYS/pi)));

Area_DIA=round(sqrt((pix_MR_SA_DIA/pi)));

%get the length of the long axis MRI
Length_SYS_p=size(MR_LA_SYS);
Length_SYS=hypot(Length_SYS_p(1),Length_SYS_p(2));

Length_DIA_p=size(MR_LA_DIA);
Length_DIA=hypot(Length_DIA_p(1),Length_DIA_p(2));
%calculate the volume of both ventricles
ESV=(4/3)*pi*(Area_SYS)^2*Length_SYS;

EDV=(4/3)*pi*(Area_DIA)^2*Length_DIA;

%calcaulate ejection fraction
EF=abs((EDV-ESV)/EDV);

%display EF
fprintf('The ejection fraction is %g',EF);