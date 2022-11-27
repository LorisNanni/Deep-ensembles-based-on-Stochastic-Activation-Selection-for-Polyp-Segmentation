function saveMask(net, imageDir,outDir,siz)
%net is the trained neural network
%imageDir, folder that stores test images
%outDir  folder where the extracted masks will be saved

imds = imageDatastore(imageDir);
numImages = numel(imds.Files);
    
                
for i=1:numImages
    img = readimage(imds, i);
    
    [bMask,mask]=getMask(net, img,siz);
    [~,name,~] = fileparts(imds.Files{i});
    %save PNG in the output dir, this image contains the scores obtained by
    %the CNN, it is useful to combine the methods
    mask=uint8(mask.*255);
    outfile=strcat(outDir,name,'.png');
    imwrite(mask,outfile);
	
    %save BMP in the output dir, this is the binary image (i.e. pixels
    %already classified in the classes)
    outfile=strcat(outDir,name,'.bmp');
    imwrite(bMask,outfile);      
end
    
end



