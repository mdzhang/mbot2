import json
import logging
from urllib.parse import parse_qs

logger = logging.getLogger()
logger.setLevel(logging.DEBUG)


def respond(err, res=None):
    response = {
        "statusCode": "400" if err else "200",
        "body": err.message if err else json.dumps(res),
        "headers": {"Content-Type": "application/json"},
    }

    return response


def handle(event, context):
    logger.debug(json.dumps(event))
    params = parse_qs(event["body"])

    #      token = params["token"][0]
    #  team_id = params["team_id"][0]
    #  channel_id = params["channel_id"][0]
    #  user_id = params["user_id"][0]
    #  user = params["user_name"][0]
    command = params["command"][0]
    #  channel = params["channel_name"][0]
    #  command_text = params["text"][0]
    #      response_url = params["response_url"][0]

    return respond(None, res={
        "response_type": "in_channel",
        "text": command,
    })
