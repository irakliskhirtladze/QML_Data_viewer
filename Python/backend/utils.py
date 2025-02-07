from pathlib import Path
from config import BASE_DIR


def resource_path(relative_path: str) -> Path:
    return BASE_DIR / relative_path
