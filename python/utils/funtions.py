import json
import logging
import uuid

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def post_request(path, body):
    if path == "/uploadImage":
        return upload_profile(body)
    else:
        return None
    
def upload_profile(body):
    profile_id = str(uuid.uuid4())
    first_name = body.get("firstName")
    last_name = body.get("lastName")
    Document_id = body.get("identityDocument")
    email = body.get("email")
    picture = body.get("picture")
    logger.info(f"creating profile for:{first_name} {last_name}")
    return {"status": "successful", "profile_id": profile_id, "name": first_name, "email": email}