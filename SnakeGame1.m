function varargout = SnakeGame1(varargin)
% SNAKEGAME1 MATLAB code for SnakeGame1.fig
%      SNAKEGAME1, by itself, creates a new SNAKEGAME1 or raises the existing
%      singleton*.
%
%      H = SNAKEGAME1 returns the handle to a new SNAKEGAME1 or the handle to
%      the existing singleton*.
%
%      SNAKEGAME1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SNAKEGAME1.M with the given input arguments.
%
%      SNAKEGAME1('Property','Value',...) creates a new SNAKEGAME1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SnakeGame1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SnakeGame1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SnakeGame1

% Last Modified by GUIDE v2.5 21-Jun-2021 09:44:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SnakeGame1_OpeningFcn, ...
                   'gui_OutputFcn',  @SnakeGame1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SnakeGame1 is made visible.
function SnakeGame1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SnakeGame1 (see VARARGIN)






% Choose default command line output for SnakeGame1
handles.output = hObject;

% Update handles structure



% UIWAIT makes SnakeGame1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

guidata(hObject, handles);
set(gca,'XTick',[],'YTick',[])
bg = axes('unit','normalized','position',[0 0 1 1]);
uistack(bg,'bottom');
im = imread('Background.JPEG')
imagesc(im);
set(bg,'handlevisibility','off','visible','off');

axes(handles.axes1);
axis('off');

% --- Outputs from this function are returned to the command line.
function varargout = SnakeGame1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in Up.
function Up_Callback(hObject, eventdata, handles)
% hObject    handle to Up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==4)
    direction=2;
    move_status=1;
end


% --- Executes on button press in Left.
function Left_Callback(hObject, eventdata, handles)
% hObject    handle to Left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==1)
    direction=3;
    move_status=1;
end

% --- Executes on button press in Right.
function Right_Callback(hObject, eventdata, handles)
% hObject    handle to Right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==3)
    direction=1;
    move_status=1;
end


% --- Executes on button press in Down.
function Down_Callback(hObject, eventdata, ~)
% hObject    handle to Down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
if~(direction==2)
    direction=4;
    move_status=1;
end


% --- Executes on button press in Pause.
function Pause_Callback(~, eventdata, handles)
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global move_status;
move_status=0;


% --- Executes on button press in StartGame.
function StartGame_Callback(hObject, eventdata, handles)
global mat_r mat_g mat_b;
global direction; direction=2
global points;points=0;
global move_status; move_status=0;
t=0.1;
locx=[50 50 50 50 50 50 50 50 50];
locy=[60 61 62 63 64 65 66 67 68];
%warna hijau
mat_r=zeros(100,100);
mat_g=128*ones(100,100);
mat_b=zeros(100,100);

update_snake(locx,locy);


%makanan
while(1)
        pt_x=randi([3 98],1);
        pt_y=randi([3 98],1);
        if sum(locx==pt_x & locy==pt_y)==0
        break;
    end
end
%warna kuning
mat_r(pt_x,pt_y)=255;
mat_g(pt_x,pt_y)=255;
mat_b(pt_x,pt_y)=0;

imshow(uint8(cat(3,mat_r,mat_g,mat_b)));

%tembok atas
while(1)
    pt_a=[linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9)];
    pt_b=[linspace(1,9,9);linspace(10,18,9);linspace(19,27,9);linspace(28,36,9);linspace(37,45,9);linspace(46,54,9);linspace(55,63,9);linspace(64,72,9);linspace(73,81,9);linspace(82,90,9);linspace(91,99,9)];
    if sum(locx==pt_a & locy==pt_b)==0
        break;
    end
end
mat_r(pt_a,pt_b)=241;
mat_g(pt_a,pt_b)=89;
mat_b(pt_a,pt_b)=86;

%tembok kanan
imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
while(1)
    pt_c=[linspace(1,9,9);linspace(10,18,9);linspace(19,27,9);linspace(28,36,9);linspace(37,45,9);linspace(46,54,9);linspace(55,63,9);linspace(64,72,9);linspace(73,81,9);linspace(82,90,9);linspace(91,99,9)];
    pt_d=[linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9)];
    if sum(locx==pt_c & locy==pt_d)==0
        break;
    end
end
%warna tembok
mat_r(pt_c,pt_d)=241;
mat_g(pt_c,pt_d)=89;
mat_b(pt_c,pt_d)=86;

imshow(uint8(cat(3,mat_r,mat_g,mat_b)));

%tembok bawah
while(1)
    pt_e=[linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9);linspace(100,100,9)];
    pt_f=[linspace(2,10,9);linspace(11,19,9);linspace(20,28,9);linspace(29,37,9);linspace(38,46,9);linspace(47,55,9);linspace(56,64,9);linspace(65,73,9);linspace(74,82,9);linspace(83,91,9);linspace(92,100,9)];
    if sum(locx==pt_e & locy==pt_f)==0
        break;
    end
end
%warna tembok
mat_r(pt_e,pt_f)=241;
mat_g(pt_e,pt_f)=89;
mat_b(pt_e,pt_f)=86;

imshow(uint8(cat(3,mat_r,mat_g,mat_b)));

%tembok kiri
while(1)
    pt_g=[linspace(2,10,9);linspace(11,19,9);linspace(20,28,9);linspace(29,37,9);linspace(38,46,9);linspace(47,55,9);linspace(56,64,9);linspace(65,73,9);linspace(74,82,9);linspace(83,91,9);linspace(92,100,9)];
    pt_h=[linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9);linspace(1,1,9)];
    if sum(locx==pt_g & locy==pt_h)==0
        break;
    end
end
%warna tembok
mat_r(pt_g,pt_h)=241;
mat_g(pt_g,pt_h)=89;
mat_b(pt_g,pt_h)=86;

imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
%membuat ular berjalan
while(1)
    imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
    pause(t);
    if(move_status)
        len=length(locx);
        for i=1:len
            mat_r(locx(i),locy(i))=0;
            mat_g(locx(i),locy(i))=128;
            mat_b(locx(i),locy(i))=0;
        end
        if sum((locx(1)==pt_x) & (locy(1)==pt_y))==1
            locx(2:len+1)=locx(1:len);
            locy(2:len+1)=locy(1:len);
            while(1)
               pt_x=randi([3 98],1);
               pt_y=randi([3 98],1);
                if sum(locx==pt_x & locy==pt_y)==0
                    break;
                end
            end
            %kuning
            mat_r(pt_x,pt_y)=255;
            mat_g(pt_x,pt_y)=255;
            mat_b(pt_x,pt_y)=0;
            points=points+1;
            set(handles.points,'String',num2str(points));
        else
            locx(2:len)=locx(1:len-1);
            locy(2:len)=locy(1:len-1);
        end
         if direction==1
             if locy(1)==100
                 locy(1)=1;
             else
                 locy(1)=locy(1)+1;
             end
         elseif direction==2
             if locx(1)==1
                 locx(1)=100;
             else 
                 locx(1)=locx(1)-1;
             end
         elseif direction==3
             if locy(1)==1
                 locy(1)=100;
             else
                 locy(1)=locy(1)-1;
             end
         elseif direction==4
             if locx(1)==100
                 locx(1)=1;
             else
                 locx(1)=locx(1)+1;
             end
         end
         %Menabrak badannya mati
         if sum((locx(2:end)==locx(1)) & (locy(2:end)==locy(1)))
             %warna merah
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.points,'String',num2str(points));
             break;
         %Menabrak tembok atas
         elseif sum((locx(1)==pt_a(1:end)) & (locy(1)==pt_b(1:end)))
             %warna merah
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.points,'String',num2str(points));
             break;
         %Menambrak tembok kanan
         elseif sum((locx(1)==pt_c(1:end)) & (locy(1)==pt_d(1:end)))
             %warna merah
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.points,'String',num2str(points));
             break;
         %Menambrak tembok bawah
         elseif sum((locx(1)==pt_e(1:end)) & (locy(1)==pt_f(1:end)))
             %warna merah
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.points,'String',num2str(points));
             break;
         %Menambrak tembok kiri
         elseif sum((locx(1)==pt_g(1:end)) & (locy(1)==pt_h(1:end)))
             %warna merah
             mat_r(:,:)=255;
             mat_g(:,:)=0;
             mat_b(:,:)=0;
             imshow(uint8(cat(3,mat_r,mat_g,mat_b)));
             msgbox('Game over..!');
             points=0;
             set(handles.points,'String',num2str(points));
             break;
         end
         
         update_snake(locx,locy);
         if points==5
             t=0.08;
         elseif points==10
             t=0.05;
         elseif points==15
             t=0.03;
         elseif points==30
             t=0.01;
         elseif points==50
             t=0.008;
         end
    end
end

% --- Executes on button press in EndGame.
function EndGame_Callback(~, ~, ~)
% hObject    handle to EndGame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
closereq();


function update_snake(locx,locy)
global mat_r mat_g mat_b
    mat_r(locx(1),locy(1))=255;
    mat_g(locx(1),locy(1))=0;
    mat_b(locx(1),locy(1))=0;

    for i=2:length(locx)
        mat_r(locx(i),locy(i))=0;
        mat_g(locx(i),locy(i))=0;
        mat_b(locy(i),locy(i))=0;
    end


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(~, eventdata, ~)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
global direction move_status;
switch(eventdata.Key)
    case 'uparrow'
        if ~(direction==4)
            direction=2;
            move_status=1;
        end
    case 'downarrow'
        if ~(direction==2)
            direction=4;
            move_status=1;
        end
    case 'rightarrow'
        if ~(direction==3)
            direction=1;
            move_status=1;
        end
    case 'leftarrow'
        if ~(direction==1)
            direction=3;
            move_status=1;
        end
    case 'return'
        move_status=0;
    otherwise
        direction=direction;
        move_status=1;
end
% --- Executes on button press in Easy.
