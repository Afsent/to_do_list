import jwt
import datetime


def encode_auth_token(app, login):
    """
    Generates the Auth Token
    :param app:
    :return: string
    """
    try:
        payload = {
            'exp': datetime.datetime.utcnow() + datetime.timedelta(days=0,
                                                                   seconds=5),
            'iat': datetime.datetime.utcnow(),
            'sub': login
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
        return False
    except jwt.InvalidTokenError:
        return False
