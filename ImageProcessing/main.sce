clear;
path = "C:/xampp2/htdocs/iniciacao/ImageProcessing/";

exec(path+"lib.sci");

foto = "crescimento-tratado.jpg";
logicalImage = toLogicalImage(foto);

figure();
ShowImage(logicalImage, 'invertida');

alturas = getHeights(logicalImage);
cols = size(logicalImage, 'c');
pos = 1:1:cols;

plot(pos, alturas);

disp(getWidth(foto));
