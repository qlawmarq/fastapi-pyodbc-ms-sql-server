from fastapi import FastAPI, HTTPException, Security, Request, File, Form, UploadFile
from fastapi.middleware.cors import CORSMiddleware
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from fastapi.responses import JSONResponse
from fastapi.encoders import jsonable_encoder
from database.query import query_get, query_update

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get('/ping')
def ping_api(request: Request):
    return JSONResponse(status_code=200, content=jsonable_encoder({'message': 'Ping'}))

@app.get("/getdate")
def getdate_api(request: Request):
    date = query_get("""
        SELECT GETDATE();
    """,())
    return JSONResponse(status_code=200, content=jsonable_encoder(date))