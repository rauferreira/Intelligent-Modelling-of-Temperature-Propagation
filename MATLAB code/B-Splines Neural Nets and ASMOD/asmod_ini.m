function fig = asmod_ini()
% This is the machine-generated representation of a Handle Graphics object
% and its children.  Note that handle values may change when these objects
% are re-created. This may cause problems with any callbacks written to
% depend on the value of the handle at the time the object was saved.
% This problem is solved by saving the output as a FIG-file.
%
% To reopen this object, just type the name of the M-file at the MATLAB
% prompt. The M-file and its associated MAT-file must be on your path.
% 
% NOTE: certain newer features in MATLAB may not have been saved in this
% M-file due to limitations of this format, which has been superseded by
% FIG-files.  Figures which have been annotated using the plot editor tools
% are incompatible with the M-file/MAT-file format, and should be saved as
% FIG-files.

load asmod_ini

h0 = figure('Color',[0.8 0.8 0.8], ...
	'Colormap',mat0, ...
	'FileName','\\Lyapunov\soft\Cristiano\Asmod\asmod_ini.m', ...
	'Name','ASMOD ALGORITHM', ...
	'NumberTitle','off', ...
	'PaperPosition',[18 180 576 432], ...
	'PaperUnits','points', ...
	'Position',[511 312 555 420], ...
	'Tag','Fig2', ...
	'ToolBar','none');
h1 = uimenu('Parent',h0, ...
	'Label','DATA', ...
	'Separator','on', ...
	'Tag','DATA', ...
	'UserData','[ ]');
h2 = uimenu('Parent',h1, ...
	'Callback','clear;[InpPat, TarPat, vis, vts]= load_data;', ...
	'Label','Load Data', ...
	'Tag','DATALoad Data1');
h2 = uimenu('Parent',h1, ...
	'Callback','save_data;', ...
	'Label','Save Data', ...
	'Tag','DATASave Data1', ...
	'UserData','[ ]');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'ListboxTop',0, ...
	'Position',[26.25 14.25 76.5 92.25], ...
	'Style','frame', ...
	'Tag','Frame1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.501960784313725 0.501960784313725 0.501960784313725], ...
	'ListboxTop',0, ...
	'Position',[102.75 14.25 113.25 92.25], ...
	'Style','frame', ...
	'Tag','Frame2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.501960784313725 0.501960784313725 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[300 14.25 91.5 92.25], ...
	'Style','frame', ...
	'Tag','Frame3');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'FontSize',12, ...
	'FontWeight','bold', ...
	'ForegroundColor',[0.250980392156863 0 0.250980392156863], ...
	'ListboxTop',0, ...
	'Position',[29.25 64.5 70.5 38.25], ...
	'String','Program Execution', ...
	'Style','text', ...
	'Tag','StaticText1', ...
	'UserData','[ ]');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.831372549019608 0.815686274509804 0.784313725490196], ...
	'Callback',mat1, ...
	'ListboxTop',0, ...
	'Position',[36.75 29.25 57.75 24.75], ...
	'String','Start', ...
	'Tag','Pushbutton1');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[103.5 54.75 111.75 13.5], ...
	'String','Add / Remove Submodel', ...
	'Style','checkbox', ...
	'Tag','Checkbox1', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[103.5 40.5 111.75 12.75], ...
	'String','Generate / Split Submodel', ...
	'Style','checkbox', ...
	'Tag','Checkbox2', ...
	'UserData','[ ]', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'ListboxTop',0, ...
	'Position',[103.5 26.25 111.75 12.75], ...
	'String','Refine / Prune Knot Vector', ...
	'Style','checkbox', ...
	'Tag','Checkbox3', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'FontSize',12, ...
	'FontWeight','bold', ...
	'ListboxTop',0, ...
	'Position',[120.75 70.5 77.25 33.75], ...
	'String','Selection phase', ...
	'Style','text', ...
	'Tag','StaticText2', ...
	'UserData','[ ]');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.752941176470588 0.752941176470588 0.752941176470588], ...
	'Callback',mat2, ...
	'ListboxTop',0, ...
	'Position',[309.75 75.75 71.25 27.75], ...
	'String','Set Initial Model', ...
	'Tag','Pushbutton2');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.501960784313725 0.501960784313725 0.501960784313725], ...
	'ListboxTop',0, ...
	'Position',[309.75 51.75 71.25 24], ...
	'String','Initial Model unchanged', ...
	'Style','text', ...
	'Tag','StaticText3');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[1 1 1], ...
	'ListboxTop',0, ...
	'Max',4, ...
	'Position',[26.25 106.5 364.5 56.25], ...
	'String',mat3, ...
	'Style','edit', ...
	'Tag','EditText1', ...
	'UserData','[ ]');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.831372549019608 0.815686274509804 0.784313725490196], ...
	'ListboxTop',0, ...
	'Position',[216 14.25 84 92.25], ...
	'Style','frame', ...
	'Tag','Frame4');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.501960784313725 0.501960784313725 1], ...
	'ListboxTop',0, ...
	'Position',[217.5 22.5 81 18.75], ...
	'String',mat4, ...
	'Style','popupmenu', ...
	'Tag','PopupMenu2', ...
	'Value',1);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.250980392156863 0.501960784313725 0.501960784313725], ...
	'FontSize',10, ...
	'ListboxTop',0, ...
	'Position',[217.5 41.25 80.25 23.25], ...
	'String','Criterion To Minimize', ...
	'Style','text', ...
	'Tag','StaticText4');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0 0.501960784313725 0.501960784313725], ...
	'FontSize',10, ...
	'ListboxTop',0, ...
	'Position',[217.5 81.75 80.25 23.25], ...
	'String','Regularization Parameter', ...
	'Style','text', ...
	'Tag','StaticText4');
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.501960784313725 0.501960784313725 1], ...
	'FontSize',10, ...
	'ListboxTop',0, ...
	'Position',[217.5 63 81 18.75], ...
	'String',mat5, ...
	'Style','popupmenu', ...
	'Tag','PopupMenu1', ...
	'UserData','[ ]', ...
	'Value',1);
h1 = axes('Parent',h0, ...
	'Units','pixels', ...
	'CameraUpVector',[0 1 0], ...
	'CameraUpVectorMode','manual', ...
	'Color',[1 1 1], ...
	'ColorOrder',mat6, ...
	'Position',[61 265 455 130], ...
	'Tag','Axes1', ...
	'XColor',[0 0 0], ...
	'YColor',[0 0 0], ...
	'ZColor',[0 0 0]);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4977973568281939 -0.1860465116279071 9.160254037844386], ...
	'String','Iterations', ...
	'Tag','Axes1Text4', ...
	'VerticalAlignment','cap');
set(get(h2,'Parent'),'XLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[-0.06387665198237885 0.4883720930232558 9.160254037844386], ...
	'Rotation',90, ...
	'String','Criterion (BIC)', ...
	'Tag','Axes1Text3', ...
	'VerticalAlignment','baseline');
set(get(h2,'Parent'),'YLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','right', ...
	'Position',[-0.1343612334801762 1.193798449612403 9.160254037844386], ...
	'Tag','Axes1Text2', ...
	'Visible','off');
set(get(h2,'Parent'),'ZLabel',h2);
h2 = text('Parent',h1, ...
	'Color',[0 0 0], ...
	'HandleVisibility','off', ...
	'HorizontalAlignment','center', ...
	'Position',[0.4977973568281939 1.054263565891473 9.160254037844386], ...
	'String','B-Spline Net Trainning Evolution', ...
	'Tag','Axes1Text1', ...
	'VerticalAlignment','bottom');
set(get(h2,'Parent'),'Title',h2);
h1 = uicontrol('Parent',h0, ...
	'Units','points', ...
	'BackgroundColor',[0.831372549019608 0.815686274509804 0.784313725490196], ...
	'Callback',mat7, ...
	'ListboxTop',0, ...
	'Position',[307.5 18.75 76.5 30.75], ...
	'String',mat8, ...
	'Tag','Pushbutton3', ...
	'UserData','[ ]');
if nargout > 0, fig = h0; end