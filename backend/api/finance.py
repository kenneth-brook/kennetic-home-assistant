from fastapi import APIRouter

router = APIRRouter()

@router.get("/")
async def get_finances():
    return [{"id": 1, "category": "Groceries", "amount": 120.50}]
