function []=m_map_gcmfaces_uv(fldU,fldV,varargin);

global mygrid;

if nargin>2; choicePlot=varargin{1}; else; choicePlot=0; end;
if nargin>3; scaleFac=varargin{2}; else; scaleFac=[]; end;
if nargin>4; subFac=varargin{3}; else; subFac=1;; end;
if nargin>5; fontSize=varargin{4}; else; fontSize=14; end;

[fldUe,fldVn]=calc_UEVNfromUXVY(fldU,fldV);

if choicePlot==-1;
%%m_proj('Miller Cylindrical','lat',[-90 90]);
%%m_proj('Equidistant cylindrical','lat',[-90 90]);
m_proj('mollweide','lon',[-180 180],'lat',[-89 89]);
%m_proj('mollweide','lon',[-100 20],'lat',[0 70]);

[uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
[xx,yy,u]=convert2pcol(mygrid.XC,mygrid.YC,uu);
[xx,yy,v]=convert2pcol(mygrid.XC,mygrid.YC,vv);
[x,y]=m_ll2xy(xx,yy);

%subsample and discard NaNs:
x=x(1:subFac:end,1:subFac:end);
y=y(1:subFac:end,1:subFac:end);
u=u(1:subFac:end,1:subFac:end);
v=v(1:subFac:end,1:subFac:end);
ii=find(~isnan(u.*v));
x=x(ii); y=y(ii); u=u(ii); v=v(ii);
m_coast('patch',[1 1 1]*.7,'edgecolor','none'); m_grid;
hold on; if isempty(scaleFac); quiver(x,y,u,v); else; quiver(x,y,u,v,scaleFac,'k'); end;
end;%if choicePlot==-1;

if choicePlot==0; subplot(2,1,1); end;
if choicePlot==0|choicePlot==1; 
if mygrid.nFaces~=5&mygrid.nFaces~=6;
    m_proj('Mercator','lat',[-70 70]);
else;
    m_proj('Mercator','lat',[-70 70],'lon',[0 360]+20);
end;
[uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
[xx,yy,u]=convert2pcol(mygrid.XC,mygrid.YC,uu);
[xx,yy,v]=convert2pcol(mygrid.XC,mygrid.YC,vv);
[x,y]=m_ll2xy(xx,yy);

%subsample and discard NaNs:
x=x(1:subFac:end,1:subFac:end);
y=y(1:subFac:end,1:subFac:end);
u=u(1:subFac:end,1:subFac:end);
v=v(1:subFac:end,1:subFac:end);
ii=find(~isnan(u.*v));
x=x(ii); y=y(ii); u=u(ii); v=v(ii);
m_coast('patch',[1 1 1]*.7,'edgecolor','none'); m_grid;
hold on; if isempty(scaleFac); quiver(x,y,u,v); else; quiver(x,y,u,v,scaleFac,'k'); end;
end;%if choicePlot==0|choicePlot==1; 

if choicePlot==1.2;

m_proj('Equidistant cylindrical','lat',[-90 90],'lon',[0 360]+20);

[uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
[xx,yy,u]=convert2pcol(mygrid.XC,mygrid.YC,uu);
[xx,yy,v]=convert2pcol(mygrid.XC,mygrid.YC,vv);
[x,y]=m_ll2xy(xx,yy);

%subsample and discard NaNs:
x=x(1:subFac:end,1:subFac:end);
y=y(1:subFac:end,1:subFac:end);
u=u(1:subFac:end,1:subFac:end);
v=v(1:subFac:end,1:subFac:end);
ii=find(~isnan(u.*v));
x=x(ii); y=y(ii); u=u(ii); v=v(ii);
m_coast('patch',[1 1 1]*.7,'edgecolor','none'); m_grid;
hold on; if isempty(scaleFac); quiver(x,y,u,v); else; quiver(x,y,u,v,scaleFac,'k'); end;
end;%if choicePlot==1.2;

if choicePlot==0; subplot(2,2,3); end;
if choicePlot==0|choicePlot==2; 
m_proj('Stereographic','lon',0,'lat',90,'rad',40);

[uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
xx=convert2arctic(mygrid.XC,0);
yy=convert2arctic(mygrid.YC,0);
u=convert2arctic(uu);
v=convert2arctic(vv);
[x,y]=m_ll2xy(xx,yy);

%subsample and discard NaNs:
x=x(1:subFac:end,1:subFac:end);
y=y(1:subFac:end,1:subFac:end);
u=u(1:subFac:end,1:subFac:end);
v=v(1:subFac:end,1:subFac:end);
ii=find(~isnan(u.*v));
x=x(ii); y=y(ii); u=u(ii); v=v(ii);
m_coast('patch',[1 1 1]*.7,'edgecolor','none'); m_grid;
hold on; if isempty(scaleFac); quiver(x,y,u,v); else; quiver(x,y,u,v,scaleFac,'k'); end;
end;%if choicePlot==0|choicePlot==1; 

if choicePlot==0; subplot(2,2,4); end;
if choicePlot==0|choicePlot==3; 
m_proj('Stereographic','lon',0,'lat',-90,'rad',40);

[uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
xx=convert2southern(mygrid.XC,0);
yy=convert2southern(mygrid.YC,0);
u=convert2southern(uu);
v=convert2southern(vv);
[x,y]=m_ll2xy(xx,yy);

%subsample and discard NaNs:
x=x(1:subFac:end,1:subFac:end);
y=y(1:subFac:end,1:subFac:end);
u=u(1:subFac:end,1:subFac:end);
v=v(1:subFac:end,1:subFac:end);
ii=find(~isnan(u.*v));
x=x(ii); y=y(ii); u=u(ii); v=v(ii);
m_coast('patch',[1 1 1]*.7,'edgecolor','none'); m_grid;
hold on; if isempty(scaleFac); quiver(x,y,u,v); else; quiver(x,y,u,v,scaleFac,'k'); end;
end;%if choicePlot==0|choicePlot==1; 

% Equatorial Pacific
if choicePlot==4.5

    % --- mirroring m_map_atl
    m_proj('mollweide','lat',[-30 30],'lon',[-240 -70]);
    xtic=[-240:20:-70]; ytic=[-30:10:30];

    [uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
    [xx,yy,u]=convert2pcol(mygrid.XC,mygrid.YC,uu);
    [xx,yy,v]=convert2pcol(mygrid.XC,mygrid.YC,vv);
    [x,y]=m_ll2xy(xx,yy);

    %ger rid of nans and subsample:
    ii=find(~isnan(u.*v)); ii=ii(1:subFac:end);
    x=x(ii); y=y(ii); u=u(ii); v=v(ii);
    hold on; if isempty(scaleFac); quiver(x,y,u,v,'k'); else; quiver(x,y,u,v,scaleFac,'k'); end; 
    m_coast('patch',[1 1 1]*.7,'edgecolor','none'); 
    m_grid_opt=['''xtick'',xtic,''ytick'',ytic'];
    eval(['m_grid(' m_grid_opt ');']);

elseif choicePlot==5.2
    m_proj('mollweide','lat',[-50 -20],'lon',[-60 30]);
    myConv='pcol';
    xtic=[-40:20:30]; ytic=[[-50:5:-20]]; xloc='bottom';


    [uu,vv]=m_map_gcmfaces_uvrotate(fldUe,fldVn);
    [xx,yy,u]=convert2pcol(mygrid.XC,mygrid.YC,uu);
    [xx,yy,v]=convert2pcol(mygrid.XC,mygrid.YC,vv);
    [x,y]=m_ll2xy(xx,yy);
    set(gca,'FontSize',fontSize);

    %ger rid of nans and subsample:
    ii=find(~isnan(u.*v)); ii=ii(1:subFac:end);
    x=x(ii); y=y(ii); u=u(ii); v=v(ii);
    hold on; if isempty(scaleFac); quiver(x,y,u,v,'k'); else; quiver(x,y,u,v,scaleFac,'k'); end; 
    m_coast('patch',[1 1 1]*.7,'edgecolor','none'); 
    m_grid_opt=['''xtick'',xtic,''ytick'',ytic,''fonts'',fontSize'];
    eval(['m_grid(' m_grid_opt ');']);
    set(gca,'FontSize',fontSize);
end; %if choicePlot==4.5
