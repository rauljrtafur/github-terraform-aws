import json
import logging
import utils.funtions as ft

logger = logging.getLogger()
logger.setLevel(logging.INFO)

#FALTA API KEY DE SEGURIDAD https://www.youtube.com/watch?v=ZOQMANm3iII


def lambda_handler(event, context):
    headers = event.get("headers")
    http = event.get("requestContext").get("http")
    method = http.get("method")
    path = http.get("path")

    if method not in ["GET", "POST"]:
        return {"statusCoode": 405, "body": json.dumps("Method Not Allowed")}
    
    if method == "POST":
        request_body = json.loads(event.get("body"))
        response_body = ft.post_request(path, request_body)
        return {"statusCoode": 201, "body": response_body}
        
    return {"statusCoode": 500, "body": json.dumps("Error: Method Not Allowed")}
