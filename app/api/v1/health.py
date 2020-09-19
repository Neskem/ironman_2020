import json
import os

from flask import Blueprint, current_app
from flask_headers import headers
from flask_caching import Cache

bp = Blueprint('sync', __name__)
cache = Cache(current_app, config={
    'CACHE_TYPE': 'redis',
    'CACHE_REDIS_HOST': '0.0.0.0',
    'CACHE_REDIS_PORT': 6379,
    'CACHE_REDIS_DB': 0
})


@bp.route('/hc', methods=['GET'])
@headers({'Content-Type': 'text/json'})
@headers({'Cache-Control': 's-maxage=0, max-age=0'})
@cache.memoize(timeout=60*60)
def hc():
    return_obj = {
        "message": 'This endpoint for web service health check'
    }
    return json.dumps(return_obj, ensure_ascii=False)
