clear;
path = "C:/xampp2/htdocs/iniciacao/ImageProcessing/";

exec(path+"lib.sci");

foto = "crescimento.jpg";
logicalImage = toLogicalImage(foto);

figure();
ShowImage(logicalImage, 'invertida');
