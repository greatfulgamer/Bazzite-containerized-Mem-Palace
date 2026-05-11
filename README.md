Bazzite Containerized MemPalace
A fully containerized LLM environment on Bazzite-DX, featuring MemPalace for spatial memory, ChromaDB for vector storage, and Playwright for web interaction—all running immutably via Podman. 

Features
✅ Local LLM with persistent memory
✅ ChromaDB-backed vector storage
✅ MemPalace (spatial memory system)
✅ Playwright for web scraping/automation
✅ Immutable base (Bazzite-DX), mutable app layer
✅ Reproducible via compose.yaml 
Setup
Clone this repo
Run: podman-compose up -d
Access via Python app or CLI
Test It
To verify it works:

1. Test ChromaDB
podman exec -it chromadb curl http://localhost:8000/api/v1/collections

Should return a JSON list of collections.

2. Test MemPalace
podman exec -it llm-app python -c "from mempalace import Palace; p = Palace(); print(p.wake_up())"

Should initialize and return memory stack.

3. Test Playwright
podman exec -it llm-app python -c "import playwright; from playwright.sync_api import sync_playwright; with sync_playwright() as p: browser = p.chromium.launch(); page = browser.new_page(); page.goto('https://httpbin.org/ip'); print(page.text_content('pre')); browser.close()"

Should print your IP from the browser.
