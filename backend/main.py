from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

from api import calendar, recipes, finance, ai

app = FastAPI(title="Kennetic Home Assistant")

# Serve static files (Vite build output)
app.mount("/static", StaticFiles(directory="backend/static"), name="static")

# Jinja2 template engine
templates = Jinja2Templates(directory="backend/templates")

# Register routers
app.include_router(calendar.router, prefix="/api/calendar", tags=["calendar"])
app.include_router(recipes.router, prefix="/api/recipes", tags=["recipes"])
app.include_router(finance.router, prefix="/api/finance", tags=["finance"])
app.include_router(ai.router, prefix="/api/ai", tags=["ai"])

# Homepage
@app.get("/", response_class=HTMLResponse)
async def home(request: Request):
    return templates.TemplateResponse("index.html", {"request": request, "title": "Home"})
