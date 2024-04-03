import json
import logging
import uuid
import base64
import io
import boto3
from PIL import Image 

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def post_request(path, body):
    if path == "/profile":
        return upload_profile(body)
    else:
        return None
    
def upload_profile(body):
    profile_id = str(uuid.uuid4())
    first_name = body.get("firstName")
    last_name = body.get("lastName")
    document_id = body.get("identityDocument")
    email = body.get("email")
    picture = body.get("picture")
    picture_replace = picture.split(",")[1]

    dynamodb = boto3.resource('dynamodb') 
    #table name 
    table = dynamodb.Table('sample') 
    #inserting values into table 
    response = table.put_item( 
       Item={ 
            'profile_id': profile_id, 
            'document_id': document_id,
            'first_name': first_name,
            'last_name': last_name,
            'email': email,
            'picture_base64': picture
        } 
    ) 
    logger.info(f"creating profile for:{first_name} {last_name}")
    # return {"status": "successful", "profile_id": profile_id, "name": first_name, "email": email, "picture":picture}
    return response
    # imagen_bytes = base64.b64decode(picture_replace)
    # img = Image.open(io.BytesIO(imagen_bytes))
    # new_img = img.resize((100, 100))
    ## print(type(imagen_bytes))
    # buffer = io.BytesIO()
    # new_img.save(buffer, format="JPEG")
    # img_b64 = base64.b64encode(buffer.getvalue())
    ## print(str(img_b64)[2:-1])
