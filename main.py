from typing import Optional
from random import uniform
from fastapi import FastAPI

app = FastAPI()

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


@app.get("/")
def read_root():
    return gen_point()


# @app.get("/items/{item_id}")
# def read_item(item_id: int, q: Optional[str] = None):
#     return {"item_id": item_id, "q": q}
