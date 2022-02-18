from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def status() -> str:
    return "up"
