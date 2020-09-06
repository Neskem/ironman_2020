import json

from flask import Blueprint
from flask_headers import headers

bp = Blueprint('sync', __name__)


@bp.route('/hc', methods=['GET'])
@headers({'Content-Type': 'text/json'})
@headers({'Cache-Control': 's-maxage=0, max-age=0'})
def hc():
    return_obj = {
        "message": 'This endpoint for web service health check'
    }
    return json.dumps(return_obj, ensure_ascii=False)
