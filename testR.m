%{.
 clc; clear all;
jpgFiles = dir('F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\datasetR\*.jpg');

for k = 1:length(jpgFiles)
    k
    filename = jpgFiles(k).name;
    

    cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\datasetR\'; 
    im = imread(filename);
    cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn';

    %im = imread("F:\thesis\mask.jpg");
    [bboxes, scores, landmarks] = mtcnn.detectFaces(im);
    %fprintf("Found %d faces.\n", numel(scores));
    if numel(scores)==1
        bboxes
        imcropped = imcrop(im, bboxes);
        %imshow(imcropped);
        cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\croppedR\';
        imwrite(imcropped, filename);
    else
        bboxes
        for k = 1 : size(bboxes, 1)
            b1 = bboxes(k,:)
            imcropped = imcrop(im, b1);
            cd 'F:\thesis\matlab-deep-learning-mtcnn-face-detection-a0a8ecc\code\mtcnn\+mtcnn\croppedR\';
            filename
            filename1 = filename(1:end-4);
            filename2 = strcat(filename1, string(k), ".jpg")
            imwrite(imcropped, filename2);
        end
    end
end

%}
%{
im = imread("F:\mask-myths.jpg");
[bboxes, scores, landmarks] = mtcnn.detectFaces(im);
fprintf("Found %d faces.\n", numel(scores));
%}

    

