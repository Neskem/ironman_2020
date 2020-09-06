from flask import Flask


def create_app():
    app = Flask(__name__)

    with app.app_context():
        from app.api.v1.health import bp as health
        app.register_blueprint(health, url_prefix='/v1')

    return app
