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
