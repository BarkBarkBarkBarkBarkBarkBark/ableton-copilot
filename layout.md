ableton-copilot/
├─ apps/
│  ├─ mcp-server/             # Python: MCP tools that call Ableton via OSC/REST bridge
│  ├─ osc-bridge/             # Python: OSC <-> Ableton (Control Surface or AbletonOSC)
│  ├─ voice-daemon/           # Python: wake word + VAD + STT (Whisper) + command bus
│  ├─ web-ui/                 # Next.js (React) + FastAPI edge adapter for WS events
│  ├─ desktop-launcher/       # Tauri (Rust) minimal launcher + tray + deep links
│  └─ m4l-device/             # Max for Live device (.amxd) + Node for Max helper
├─ packages/
│  ├─ schemas/                # Shared Pydantic/TypeScript types (commands, events)
│  ├─ prompt-kits/            # System prompts, MCP tool cards, examples
│  └─ messaging/              # ZeroMQ/Redis pubsub shims + WS event contracts
├─ ops/
│  ├─ docker/                 # Dockerfiles
│  ├─ compose/                # docker-compose.yml (dev)
│  └─ scripts/                # bootstrap scripts (install, run, package)
├─ .env.example
├─ stack.yml                  # this file: pinned deps + run graph
└─ README.md