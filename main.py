from flask import Flask, json
from random import uniform
import os

PORT = int(os.environ.get('OPENSHIFT_PYTHON_PORT', 8080))

api = Flask(__name__)

def gen_point():
  x, y = uniform(-180,180), uniform(-90, 90)
  return {
    "type": "Feature",
    "geometry": {
      "type": "Point",
      "coordinates": [x, y]
    },
    "properties": {
      "name": "sample point"
    }
  }


@api.route('/point', methods=['GET'])
def get_point():
  return json.dumps(gen_point())

if __name__ == '__main__':
    api.run(host='0.0.0.0', port=PORT)
