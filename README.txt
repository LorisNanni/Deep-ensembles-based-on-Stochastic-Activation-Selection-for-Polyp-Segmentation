

You have to unrar kvasir dataset for testing the method (obviously you can modify the code for 
running it in another dataset).

The variable 'reluMethod' of trainSegmentation is used for choosing the activation function:
%'none' -> standard ReLU is used
%'random' -> random replacement of ReLu layer with other activation function,
%i.e. the stochastic approch, be careful maskDir
%otherwise you can choose one of this activation function
%{'widerLearnableReluLayer','leakyReluLayer', 'seluLayer','learnableReluLayer','preluLayer','sreluLayer','apluLayer','galuLayer','smallGaluLayer'};

then the variable 'modelName' stores the name of the folder where the masks of the test images will be saved.
if you want to run the stocastic approach you have to save each run in a different folder.
Then the fusion is simply performed by sum rule (sum of the masks then dividing for the number of approaches of the ensemble) 
i.e. for each image all the values of all the masks are summed and divided for the number of approaches that belong to the ensemble


In the code we choose
classWeights =   [3.2464; 0.5910], 
these values are extracted simply from the training data of Kvasir, you should change them if you run the code in another dataset

%notice that the code is suited for biclass classification, if you run it on a multiclass problem you have to change some functions,
e.g. pxds = pixelLabelDatastore(labelDir,["one","zero"],[1 0]);%address of each training mask

%finally, we have performed data augmentation in the following way
fliplr(img);
flipud(img);
rot90(img);
and the same operation on the mask
these new images are saved and added to the folder that store the dataset




%%%%%% HELP MEMORY PROBLEM %%%%%%%%%%%%%%%
if you have memory problem with the stochastic approach then reduce the value of batch size  




