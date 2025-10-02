from fastapi import APIRouter

router = APIRouter()

@router.get("/")
async def get_recipes():
    return [{"id": 1, "title": "Spaghetti Bolognese"}]
