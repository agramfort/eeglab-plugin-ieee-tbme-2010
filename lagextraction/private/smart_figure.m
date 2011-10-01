function h = smart_figure(name)
%
%   Returns index of the figure with a given name.
%   It returns a new figure when no figure with that name exists
%   


hw = get(0,'children');
hw = sort(hw);

for i = 1:length(hw),
  s = get(hw(i),'Name');
  if(strcmp(deblank(s),deblank(name))),
    h = hw(i);
    figure(h)
    return;
  end
end

% we exited out without a match, make the window
h = figure;
set(h,'Name',name);

return

