import jwt
import datetime


def encode_auth_token(app, login):
    """
    Generates the Auth Token
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
