# app/tests/conftest.py  (or tests/conftest.py)
import os
import importlib
import importlib.util
import pytest
from types import ModuleType


def _load_app_from_file(path):
    """
    Load a module from a file path and return the attribute named 'app' if present.
    """
    spec = importlib.util.spec_from_file_location("app_from_file", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    if hasattr(module, "app"):
        return getattr(module, "app")
    raise ImportError(f"No 'app' attribute found in module loaded from {path}")


# Try the normal import first (from app import app)
try:
    # This might import a package named `app` (the folder) or the module `app.py`.
    from app import app as fastapi_app

    # If the imported `fastapi_app` is actually a module (package), try fallback
    if isinstance(fastapi_app, ModuleType):
        raise ImportError("Imported 'app' is a module, not the FastAPI app instance")
except Exception:
    # Fallback: try to find app.py at the repository root (one level up from tests folder)
    # Adjust the relative path if your repo layout differs.
    this_dir = os.path.dirname(__file__)  # e.g. repo-root/app/tests or repo-root/tests
    # Look for app.py in parent directories until repo root
    candidate = os.path.abspath(os.path.join(this_dir, "..", "app.py"))
    if not os.path.exists(candidate):
        # As a second attempt, try two levels up (in case tests are nested)
        candidate = os.path.abspath(os.path.join(this_dir, "..", "..", "app.py"))

    if not os.path.exists(candidate):
        raise ImportError(
            "Could not import FastAPI 'app' — tried standard import and fallback paths. "
            f"Looked for app.py at: {candidate}"
        )

    fastapi_app = _load_app_from_file(candidate)


@pytest.fixture(scope="session")
def client():
    from starlette.testclient import TestClient

    return TestClient(fastapi_app)
