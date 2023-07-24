import cv2
import os
import numpy as np


fuente = cv2.FONT_ITALIC
color = (0, 255, 255)
grosor = 2
escala = 1
posicion_texto = [(400, 400), (400, 350), (400, 400)]
pos = 0
umbral = 50
area_min1 = 100
area_min2 = 300
area_min3 = 400


clasificador = cv2.CascadeClassifier(
    'D:/Documentos/Documents/Universidad/Seminario/Modulo Gerson/Dataset/classifier/cascade.xml')

for filename in os.listdir('Dataset/tst'):
    img = cv2.imread(
        os.path.join('Dataset/tst', filename))
    img_byn = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    vehiculos = clasificador.detectMultiScale(
        img_byn, scaleFactor=1.01, minNeighbors=3, minSize=(24, 24))
    _, img_umbral = cv2.threshold(img_byn, umbral, 255, cv2.THRESH_BINARY_INV)

    if len(vehiculos) == 0:
        print('No hay vehiculos detectados')
    elif len(vehiculos) >= 1:
        for (x, y, w, h) in vehiculos:
            cv2.rectangle(img, (x, y), (x+w, y+h), color, grosor)

    contours, _ = cv2.findContours(
        img_byn, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)
    cv2.putText(img, 'Vehiculos: ' + str(len(vehiculos)),
                posicion_texto[pos], fuente, escala, (255, 0, 255), grosor)
    pos = pos+1

    cv2.imshow(filename, img)
    cv2.waitKey(0)
    cv2.destroyAllWindows
