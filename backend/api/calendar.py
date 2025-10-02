from fastapi import APIRouter

router = APIRouter()

@router.get("/")
async def get_events():
    return [{"id": 1, "title": "Sample Event"}]

@router.post("/")
async def create_event(event: dict):
    return {"message": "Event created", "event": event}
