


function varargout = matgui1(varargin)
% MATGUI1 M-file for matgui1.fig
%      MATGUI1, by itself, creates a new MATGUI1 or raises the existing
%      singleton*.
%
%      H = MATGUI1 returns the handle to a new MATGUI1 or the handle to
%      the existing singleton*.
%
%      MATGUI1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MATGUI1.M with the given input arguments.
%
%      MATGUI1('Property','Value',...) creates a new MATGUI1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before matgui1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to matgui1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help matgui1

% Last Modified by GUIDE v2.5 08-Mar-2015 02:02:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @matgui1_OpeningFcn, ...
                   'gui_OutputFcn',  @matgui1_OutputFcn, ...
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


% --- Executes just before matgui1 is made visible.
function matgui1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to matgui1 (see VARARGIN)

% Choose default command line output for matgui1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes matgui1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.stop,'Enable','off'); 

s = serial('COM1');
set(s,'BaudRate',9600);
set(s,'Timeout',20);
set(s,'ReadAsyncMode','continuous');
fopen(s);
handles=guidata(hObject);
handles.set=s;
guidata(hObject,handles);


% --- Outputs from this function are returned to the command line.
function varargout = matgui1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
   
  set(handles.start,'Enable','off');  
  set(handles.Refresh,'Enable','off');
  set(handles.stop,'Enable','on');
  drawnow;
  
  s=handles.set;
  flushinput(s);   %input buffer to be flushed
fprintf(s,'%c','s');
i=1;
 string1='start';
       set(handles.edit5, 'String', string1);
     drawnow;
     condition=1;
     handles=guidata(hObject);
handles.con=condition;
guidata(hObject,handles);
while(condition==1)
    if(s.BytesAvailable>0)
        a = fread(s,1,'uint8');
      t(i)=a;
      drawnow;
      plotData=plot(t,'linewidth',1);
         drawnow;
      
         grid on;
       drawnow;
       i=i+1; 
       string1='inside the start callback';
       set(handles.edit5, 'String', string1);
    end
      string1='i am trying my best to work the problem';
       set(handles.edit5, 'String', string1); 
       handles=guidata(hObject);
       condition=handles.con;
end
      string1='i did it';
       set(handles.edit5, 'String', string1);   
       drawnow;
       
       


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

condition=0;
 handles=guidata(hObject);
handles.con=condition;
guidata(hObject,handles);
  set(handles.stop,'Enable','off');
  set(handles.start,'Enable','on');  
  set(handles.Refresh,'Enable','on');
  drawnow;
setup=handles.set;
fprintf(setup,'%c','g');
flushinput(setup);
 string1='stop';
       set(handles.edit5, 'String', string1);
     debugger=0;
     while(debugger~=50)
        string1='stopping na ';
       set(handles.edit5, 'String', string1);
       debugger=debugger+1;
     end



    
      

% --- Executes on button press in Refresh.
function Refresh_Callback(hObject, eventdata, handles)
% hObject    handle to Refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    string1='inside refresh';
       set(handles.edit5, 'String', string1); 
       drawnow;    
    setup=handles.set;
  if( isempty(get(handles.edit1,'String'))|| isempty(get(handles.edit2,'String'))||isempty(get(handles.edit3,'String'))||isempty(get(handles.edit4,'String')) )
      string1='please fill all the values';
       set(handles.edit5, 'String', string1); 
       drawnow;
  else   
     set(handles.stop,'Enable','off');
  set(handles.start,'Enable','on');  
  set(handles.Refresh,'Enable','off');  
  drawnow;
   t(1)=str2num(get(handles.edit1,'String'));       
     t(2)=str2num(get(handles.edit2,'String'));
     t(3)=str2num(get(handles.edit3,'String'));
       t(4)=str2num(get(handles.edit4,'String'));
  
  flushinput(setup);
     fprintf(setup,'%c','r');                            
   
     refresh=0;
     while(refresh==0)
     if(setup.BytesAvailable>0)
     refresh = fread(setup,1,'uint8');
      end
     end
      adder=1;
      
      while(adder~=5)
       fwrite(setup,t(adder),'uint8');                  
       chaos=0
       while(chaos==0)
       if(setup.BytesAvailable>0)
      setp(adder)=fread(setup,1,'uint8');                       
      chaos=1;
       end
       end
         
      
      adder=adder+1;
      
      end
  string1='done';
       set(handles.edit5, 'String', string1);
       drawnow;
        set(handles.Refresh,'Enable','on'); 
  end 
    

function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end















