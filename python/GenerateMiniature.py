from flask import Flask, request, jsonify 
from PIL import Image 
from io import BytesI0
import boto3

app = Flask(__name__)
# Configuración de AWS S3
s3 = boto3.client(
    's3'
    aws_access_key_id='TU_ ACCESS_KEY_ ID'
    aws_secret_access_key='TU_SECRET_ACCESS_KEY'
)

@app.route('/subir_imagen', methods=['POST'])
def subir_imagen():
    if 'imagen' not in request.files:
        return jsonify({'error': 'No seproporcionó ninguna imagen'}), 400
    imagen = request.files['imagen']
    imagen_original = Image.open(imagen)
    tamaño_miniatura = (100, 100)
    imagen_miniatura = imagen_original.resize(tamaño_miniatura)

    # Convertir imagen a bytes
    buffer = Bytes10()
    imagen_miniatura.save(buffer, format='JPEG')
    buffer.seek(0)
    imagen_bytes = buffer.read()

    # Guardar en AWS S3
    s3.put_object(Body=imagen_bytes,Bucket='NOMBRE_BUCKET',Key='miniatura.jpg')
        
    return jsonify({'mensaje': 'Miniatura de la imagen almacenada correctamente en AWS S3'}),200
if __name__ == '__main__':
    app.run (host='0.0.0.0', port=8080)