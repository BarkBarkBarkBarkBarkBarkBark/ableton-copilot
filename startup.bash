# 1) clone, create .env from .env.example and set OPENAI_API_KEY if using OpenAI
# 2) install python deps
uv venv && source .venv/bin/activate  # or python -m venv .venv
pip install -r requirements.txt       # Cursor can generate per-app reqs from stack.yml

# 3) install web-ui deps
cd apps/web-ui && npm i && cd -

# 4) (optional) bring up redis
docker run --rm -p 6379:6379 redis:7-alpine

# 5) run services (separate terminals)
python apps/osc-bridge/main.py
python apps/mcp-server/main.py
python apps/voice-daemon/main.py
npm --prefix apps/web-ui run dev

# 6) in Live, load m4l-device/ableton_copilot.amxd and toggle Enable