import cv2
import os


color = (0, 255, 255)
grosor = 2

clasificador = cv2.CascadeClassifier(
    'D:/Documentos/Documents/Universidad/Seminario/Modulo Gerson/Dataset/classifier/cascade.xml')
print(os.listdir('Dataset/tst'))
for filename in os.listdir('Dataset/tst'):
    img = cv2.imread(
        os.path.join('Dataset/tst', filename))
    img_byn = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    vehiculos = clasificador.detectMultiScale(
        img_byn, scaleFactor=1.05, minNeighbors=2, minSize=(24, 24), maxSize=(124, 183))
    _, img_umbral = cv2.threshold(img_byn, 120, 255, cv2.THRESH_BINARY_INV)
    print(len(vehiculos))

    if len(vehiculos) == 0:
        print('No hay vehiculos detectados')
    elif len(vehiculos) >= 1:
        for (x, y, w, h) in vehiculos:
            cv2.rectangle(img_byn, (x, y), (x+w, y+h), color, grosor)

    contours, _ = cv2.findContours(
        img_byn, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
    cv2.drawContours(img_byn, contours, -1, color, grosor)

    cv2.imshow(filename, img_byn)
    cv2.waitKey(0)
    cv2.destroyAllWindows
