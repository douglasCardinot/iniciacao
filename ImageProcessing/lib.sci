function logicalImage = toLogicalImage(foto)
    stacksize('max');
    imgPath = "img/";
    RGB = ReadImage(path+imgPath+foto);
    image = RGB2Gray(RGB);
    clear("RGB");
    invertedImage = uint8(255 * ones(size(image, 1), size(image, 2))) - image;
    clear("image");
    logicalImage = SegmentByThreshold(invertedImage, 110);
endfunction


function heights = getHeights(logicalImage)
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


function width = getWidth(foto)
    logicalImage = toLogicalImage(foto);
    heights = getHeights(logicalImage);
    width = stdev(heights);
endfunction
