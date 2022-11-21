%{.
 clc; clear all;
jpgFiles = dir('F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\dataset2\*.jpg');

for k = 1:length(jpgFiles)
    k
    filename = jpgFiles(k).name;
    

    cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\dataset2\'; 
    im = imread(filename);
    cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn';

    %im = imread("F:\thesis\mask.jpg");
    [bboxes, scores, landmarks] = mtcnn.detectFaces(im);
    %fprintf("Found %d faces.\n", numel(scores));
    if numel(scores)==1
        imcropped = imcrop(im, bboxes);
        %imshow(imcropped);
        cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\cropped2\';
        imwrite(imcropped, filename);
    else
        cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\cropped2\';
        imwrite(im, filename);
    end
end

%}
%{
im = imread("F:\mask-myths.jpg");
[bboxes, scores, landmarks] = mtcnn.detectFaces(im);
fprintf("Found %d faces.\n", numel(scores));
%}

    

