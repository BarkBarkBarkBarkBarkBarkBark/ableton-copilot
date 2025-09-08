# Project: Ableton Copilot (MCP + OSC + Voice + Max for Live)
# Goal: Voice-activated Ableton assistant launched via Max for Live, with MCP tool APIs, OSC bridge, voice daemon, and Next.js web UI.

# ==== CONTEXT ====
- Root repo name: ableton-copilot
- Structure: monorepo with Python apps (mcp-server, osc-bridge, voice-daemon), Next.js web-ui, optional Tauri desktop launcher, and a Max for Live .amxd device with Node for Max helper.
- Communication flow: MCP tools -> JSON -> osc-bridge -> OSC messages -> Ableton Live (via AbletonOSC control surface).
- Voice flow: wake word + STT -> transcript -> MCP tool invocation.
- Web UI: shows transcript, tool invocations, OSC log, and track/scene graph.
- All configs & scaffolding defined in `stack.yml`.

# ==== FILES TO CREATE / REFERENCE ====
apps/
  mcp-server/
    main.py          # FastAPI server exposing MCP tools, forwards to osc-bridge
  osc-bridge/
    main.py          # FastAPI app that maps JSON commands to OSC messages
  voice-daemon/
    main.py          # Wake word + VAD + STT (Whisper), posts transcript to MCP
  web-ui/            # Next.js dashboard (npm run dev)
  desktop-launcher/  # optional Tauri app
  m4l-device/
    ableton_copilot.amxd  # Max for Live Audio Effect device
    node/boot.js          # Node for Max script that boots all services

packages/
  schemas/           # Pydantic + TS types for commands/events
  prompt-kits/       # Example prompts, MCP tool cards
  messaging/         # Redis/WS event contracts

ops/
  docker/            # Dockerfiles
  compose/           # docker-compose.yml
  scripts/           # bootstrap scripts

stack.yml            # main spec: deps, env vars, run graph, contracts, scaffolds
README.md            # usage + setup
.env.example         # API keys and ports

# ==== REQUIREMENTS ====
1. Generate minimal working code for all entrypoints listed above (FastAPI apps, OSC bridge, MCP tool stub, voice daemon loop, Node for Max boot.js).
2. Implement contracts from stack.yml:
   - `/osc` POST route in osc-bridge maps JSON cmd -> OSC addr.
   - MCP tool example (bpm.set) forwards to osc-bridge.
   - Voice daemon loop simulates wake word, transcribes, posts to MCP.
   - Node for Max boot script spawns services & opens web UI.
3. Scaffold web-ui with Next.js + Tailwind + Socket.IO (placeholder dashboard).
4. Use environment variables from .env.example (`OSC_HOST`, `OSC_PORT_OUT`, `OSC_PORT_IN`, `OPENAI_API_KEY`, etc.).
5. Provide `requirements.txt` per Python app, `package.json` in web-ui, and a Docker Compose for Redis + services.
6. Ensure README.md contains install/run instructions (dev mode and M4L boot mode).
7. Follow the run graph in stack.yml for service startup order.

# ==== STYLE ====
- Keep code minimal but runnable.
- Include inline comments that explain key parts.
- Prioritize clarity over cleverness.
- Assume developer is using Cursor to fill in details iteratively.

# ==== TASK ====
👉 Scaffold this repo end-to-end in YOLO mode using the above context. Create all stub files with minimal code and reference `stack.yml` as the source of truth.