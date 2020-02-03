import jwt
import datetime
from bottle import response


def encode_auth_token(app, user_id):
    """
    Generates the Auth Token
    :param app:
    :return: string
    """
    try:
        payload = {
            'exp': datetime.datetime.utcnow() + datetime.timedelta(days=0,
                                                                   minutes=1),
            'iat': datetime.datetime.utcnow(),
            'sub': user_id
        }
        return jwt.encode(
            payload,
            app.config.get('SECRET_KEY'),
            algorithm='HS256'
        )
    except Exception as e:
        return e


def decode_auth_token(app, auth_token):
    """
    Decodes the auth token
    :param app:
    :param auth_token:
    :return: integer|string
    """
    try:
        payload = jwt.decode(auth_token, app.config.get('SECRET_KEY'),
                             algorithm='HS256')
        return payload['sub']
    except jwt.ExpiredSignatureError:
        response.delete_cookie("token")
        return False
    except jwt.InvalidTokenError:
        response.delete_cookie("token")
        return False
