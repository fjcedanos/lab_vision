clear all;close all;clc
% Vecinos cercanos
d=zeros(750,750);
h1=750;
h2=750;
load('HIS');
load('HIS_T');
HIS_Train=cell2mat(HIS);
HIS_Test=cell2mat(HIS_T);
HIS_Train=HIS_Train';
HIS_Test=HIS_Test';
cnt=1;
for j=1:30:length(HIS_Train)
for i=1:30
    classLabels(i+(j-1))=cnt;
end
cnt=cnt+1;
end
for i=1:h1
    for j=1:h2
        d(i,j)=intersection(HIS_Train(i,:)',HIS_Train(j,:)');
    end
end
for i=1:length(d(:,1))
    d_max(i)=max(d(i,:));
       for j=1:length(d)
            if d(i,j)==d_max(i)
               predictedClass(i)=classLabels(j);
            end
       end
end
predictedClass=predictedClass';
%% Tree Forest
clear all;close all;clc
addpath('Var2')
rng default
load('HIS');
load('HIS_T');

HIS_Train=cell2mat(HIS);
HIS_Test=cell2mat(HIS_T);

HIS_Train=HIS_Train';
HIS_Test=HIS_Test';
features = HIS_Train;
cnt=1;
for j=1:30:length(HIS_Train)
    for i=1:30
        classLabels(i+(j-1))=cnt;
    end
cnt=cnt+1;
end
classLabels=classLabels';

% How many trees do you want in the forest? 
nTrees = 100;

% Train the TreeBagger (Decision Forest).
B = TreeBagger(nTrees,features,classLabels,'OOBPred','On');
% Given a new individual WITH the features and WITHOUT the class label,
% what should the class label be?

oobErrorBaggedEnsemble = oobError(B);
plot(oobErrorBaggedEnsemble)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';
Mdl7 = fitctree(features,classLabels,'MaxNumSplits',7,'CrossVal','on');
view(Mdl7.Trained{1},'Mode','graph')
%%
tic
cnt=1;
for i=1:length(HIS_Test)
    newData1 = HIS_Test(i,:);
% Use the trained Decision Forest.
    predChar1= B.predict(newData1);
    predictedClass(cnt) = str2double(predChar1);
    cnt=cnt+1;
end
toc
% Predictions is a char though. We want it to be a number.
%predictedClass = str2double(predChar1)
%%
%Matriz de confusión
load('PredictedClass_Inter_train')
load('HIS')
predicted=predictedClass';
cnt=1;
HIS_Train=cell2mat(HIS);
for j=1:30:length(HIS_Train)
for i=1:30
    known(i+(j-1))=cnt;
end
cnt=cnt+1;
end
%Matriz
[C,order]=confusionmat(known,predicted);
%%
load('PredictedClass_Tree_train')
load('HIS')
predicted=predictedClass';
cnt=1;
HIS_Train=cell2mat(HIS);
for j=1:30:length(HIS_Train)
for i=1:30
    known(i+(j-1))=cnt;
end
cnt=cnt+1;
end
%Matriz
C2=confusionmat(known,predictedClass);

%%
%Matrices
clear all;clc;close all;
load('ConfusionMatrix_Inter.mat')
C1=C;

load('ConfusionMatrix_Tree.mat')
C3=C2;
load('ConfusionMatrix_Tree_train.mat')
C4=C2;
load('ConfusionMatrix_Inter_train.mat')
C2=C;
figure;subplot(2,2,1),imagesc(C1),ylabel('TEST','Fontsize',13),title('Nearest Neighbour','Fontsize',13);
subplot(2,2,2),imagesc(C3),title('Random Forest','Fontsize',13);
subplot(2,2,3),imagesc(C2),xlabel('Número de Predicciones'),ylabel('TRAIN','Fontsize',13);
subplot(2,2,4),imagesc(C4),xlabel('Número de Predicciones');
%comparaciones
suma1=0;
suma2=0;
suma3=0;
suma4=0;
for i=1:25
suma1=suma1+diag(C1(i,i));
suma2=suma2+diag(C2(i,i));
suma3=suma3+diag(C3(i,i));
suma4=suma4+diag(C4(i,i));
end
