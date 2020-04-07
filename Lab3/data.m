
try
 fclose(instrfind);
end;
s1 = serial('COM7', ... % Change as needed!
 'BaudRate', 115200, ...
 'Parity', 'none', ...
 'DataBits', 8, ...
 'StopBits', 1, ...
 'FlowControl', 'none');
fopen(s1);
try
fprintf('Press CTRL+C to finish\n');
x = 1:1000;
y = sin(2*pi*x/1000);
hLine = plot(x,y);

 while (1)
 val=fscanf(s1);
 result = sscanf(val, '%f');
 StripChart('Update',hLine,y(result))
 fprintf('T=%5.2fC\n', result);
 end
end
fclose(s1);
