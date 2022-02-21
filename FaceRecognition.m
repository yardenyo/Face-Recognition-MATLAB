% Yarden Yosef - 308345602 , Itai Simhony - 312179906 ;
function varargout = FaceRecognition(varargin)
% FaceRecognition MATLAB code for FaceRecognition.fig
%      FaceRecognition, by itself, creates a new FaceRecognition or raises the existing
%      singleton*.
%
%      H = FaceRecognition returns the handle to a new FaceRecognition or the handle to
%      the existing singleton*.
%
%      FaceRecognition('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FaceRecognition.M with the given input arguments.
%
%      FaceRecognition('Property','Value',...) creates a new FaceRecognition or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FaceRecognition_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FaceRecognition_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FaceRecognition

% Last Modified by GUIDE v2.5 11-Feb-2022 17:27:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FaceRecognition_OpeningFcn, ...
                   'gui_OutputFcn',  @FaceRecognition_OutputFcn, ...
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


% --- Executes just before FaceRecognition is made visible.
function FaceRecognition_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FaceRecognition (see VARARGIN)

% Choose default command line output for FaceRecognition
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FaceRecognition wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FaceRecognition_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.output = hObject;
[file_name, file_path] =uigetfile({'*'});
handles.img=imread([file_path file_name]);
imshow(handles.img,'parent',handles.axes1);
guidata(hObject,handles);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val = get(handles.popupmenu1,'value'); % Get pop up menu value
object = ""; % Get the object that was recognized or wasn't
switch(val)
    case 2
        loaded_img = handles.img; % Read the image
        FaceDetector = vision.CascadeObjectDetector(); % Get FaceDetector object
        BBOX = step(FaceDetector, loaded_img); % Activate Face detector and get the face
        B = insertObjectAnnotation(loaded_img, 'rectangle', BBOX, 'Face'); % Get the recognized face
        object = "Face"; % Get the object we found
        imshow(B); % Show the recognized face
    case 3
        loaded_img = handles.img; % Read the image
        % Get EyePairBigDetector object
        EyePairBigDetector = vision.CascadeObjectDetector('EyePairBig'); 
        EyePairBigDetector.MergeThreshold = 20; % Change the threshold
        BBOX = step(EyePairBigDetector, loaded_img); % Activate EyePairBigDetector and get the eyes
        B = insertObjectAnnotation(loaded_img, 'rectangle', BBOX, 'Pair Of Eyes'); % Get the recognized eyes
        object = "Pair Of Eyes"; % Get the object we found
        imshow(B); % Show the recognized eyes
    case 4
        loaded_img = handles.img; % Read the image
        % Get NoseDetector object
        NoseDetector = vision.CascadeObjectDetector('Nose');
        NoseDetector.MergeThreshold = 30; % Change the threshold
        BBOX = step(NoseDetector, loaded_img); % Activate NoseDetector and get the nose
        B = insertObjectAnnotation(loaded_img, 'rectangle', BBOX, 'Nose'); % Get the recognized nose
        object = "Nose"; % Get the object we found
        imshow(B); % Show the recognized nose
    case 5
        loaded_img = handles.img; % Read the image
        % Get MouthDetector object
        MouthDetector = vision.CascadeObjectDetector('Mouth');
        MouthDetector.MergeThreshold = 300; % Change the threshold
        BBOX = step(MouthDetector, loaded_img); % Activate MouthDetector and get the mouth
        B = insertObjectAnnotation(loaded_img, 'rectangle', BBOX, 'Mouth'); % Get the recognized mouth
        object = "Mouth"; % Get the object we found
        imshow(B); % Show the recognized mouth
end

n = size(BBOX,1); % Get number of BBOX's
if n >= 1 % if more than 1 BBOX
    set(handles.message , 'String' , n + " " + object + " was Recognized"); % We recognized object
    set(handles.message , 'BackgroundColor' , 'green'); % Make the background color green
else
    set(handles.message , 'String' , "no " + object + " was Recognized"); % We haven't recognized object
    set(handles.message , 'BackgroundColor' , 'red'); % Make the background color red
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
