from fastapi import APIRouter

router = APIRouter()

@router.post("/chat")
async def chat(prompt: str):
    return {"response": "AI is currently disabled. (Placeholder response)"}
