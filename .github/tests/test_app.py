import pytest
from app import app

@pytest.fixture
def client():
    with app.test_client() as client:
        yield client

def test_home_route(client):
    response = client.get('/')
    assert response.status_code == 200
    assert b'API' in response.data

def test_health_route(client):
    response = client.get('/health')
    assert response.status_code == 200
    assert b'healthy' in response.data