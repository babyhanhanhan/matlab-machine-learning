
% Set constants
f             = 5.5/24;           % Frequency
halfSDsq      = 3/( 2*pi*f*24 );  % Sigma
gamma         = 0.75;
phases        = 2;
ori           = 4;                %orientation
 
% Hard coded filter properties
kernelSize    = 11;               % Windowsize
 
% Please provide the Training set location & 'No_Testset'
TrainingSet_add = 'F:\Matlab\new';
% TrainingSet_add = 'F:\101_ObjectCategories';
No_Testset      = 15;
 
 [TrainingSet_location, Train_label_Names, noFiles] = DirRead(TrainingSet_add,'*.jpg');
 
% Process Training set & Test set
 [TrainingSet,TestSet,train_label]  = SVM_datasets(TrainingSet_location, No_Testset,51, 51);

  Training_Set = ImgGabor(TrainingSet, kernelSize, ori, phases, gamma, f, halfSDsq);
  TestSet     = ImgGabor(TestSet, kernelSize, ori, phases, gamma, f, halfSDsq);

result=multiBoost(Training_Set,train_label,Test_Set,'GentleBoost',50,'tree');
