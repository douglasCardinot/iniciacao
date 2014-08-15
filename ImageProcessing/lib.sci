function logicalImage = toLogicalImage(foto)
    stacksize('max');
    imgPath = "img/";
    RGB = ReadImage(path+imgPath+foto);
    image = RGB2Gray(RGB);
    clear("RGB");
    invertedImage = uint8(255 * ones(size(image, 1), size(image, 2))) - image;
    clear("image");
    logicalImage = SegmentByThreshold(invertedImage, 80);
endfunction

function imageWithoutNoises = removeNoises(logicalImage)
    INTERVAL_CONSIDERED = 30;
    ACCEPTED_VALUE_INTERVAL = 4;
    
    rows = size(logicalImage, 'r');
    cols = size(logicalImage, 'c');
    j=30;
    i=1;
    for i=1:cols
        for j=rows:-1:1
            if ~logicalImage(j,i) then
                qttInSequence = 0;
                for aux=1:INTERVAL_CONSIDERED
                    if j-aux > 0 then
                        if logicalImage(j-aux,i) then
                            qttInSequence = qttInSequence + 1;
                            if qttInSequence >= ACCEPTED_VALUE_INTERVAL then
                                logicalImage(j,i) = %T;
                            end
                        else 
                            qttInSequence = 0;
                        end
                    end
                end
                
            end
        end
    end
    
    imageWithoutNoises = logicalImage;
endfunction


function heights = getHeights(logicalImage)
    
    logicalImage = removeNoises(logicalImage);
    
    rows = size(logicalImage, 'r');
    cols = size(logicalImage, 'c');
    alturas = zeros(1, cols);
    
    for i=1:cols
        for j=rows:-1:1
            if logicalImage(j,i) then
                alturas(i) = alturas(i) + 1;
            else break;
            end
        end
    end
    
    heights = alturas;
endfunction


function standardDeviation = getStandardDeviation(foto)
    logicalImage = toLogicalImage(foto);
    heights = getHeights(logicalImage);
    standardDeviation = stdev(heights);
endfunction
