function [] = savefig(image_name,font_size,formats)
%   SAVEFIG   save current figure in image file
%       [] = SAVEFIG(IMAGE_NAME,FONT_SIZE)
% 
%   Created by Alexandre Gramfort on 2008-11-11.
%   Copyright (c) 2007 Alexandre Gramfort. All rights reserved.


% hack
return

if nargin < 3
    formats = {'png'};
end

if nargin < 2
    font_size = 22;
end

if ~exist('image_name')
    image_name = get(gcf,'Name');
end

all_axis = get(gcf,'children');

name_eps = [image_name,'.eps'];
name_jpg = [image_name,'.jpg'];
name_png = [image_name,'.png'];
name_pdf = [image_name,'.pdf'];

for ii=1:length(all_axis)
    try
        title(all_axis(ii),' ')
        set(all_axis(ii),'FontSize',font_size);
        set(get(all_axis(ii),'xlabel'),'FontSize',font_size);
        set(get(all_axis(ii),'ylabel'),'FontSize',font_size);
        set(get(all_axis(ii),'zlabel'),'FontSize',font_size);
    end
end

if any(strcmp('png',formats))
    saveas(gcf,name_png,'png');
    %%% try to trim png file
    disp('please wait, trim png file....');
    command = sprintf(['convert -trim %s %s'],name_png,name_png);
    [STATUSVAR,STATUSMESSAGE] = unix(command);
    
    if STATUSVAR ~= 0
       error( STATUSMESSAGE );
    else
       disp('trim completed');
    end
end

if any(strcmp('pdf',formats))
    print_pdf(name_pdf,gcf);
end

if any(strcmp('eps',formats))
    saveas(gcf,name_eps,'epsc');
end

if any(strcmp('jpg',formats))
    saveas(gcf,name_jpg,'jpg');
end

