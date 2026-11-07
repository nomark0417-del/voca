---
name: headroom
description: >-
  Headroom (headroomlabs-ai/headroom) context optimization, token reduction, and CCR (Content-Centric Retrieval)
  literacy skill. Guides the agent to efficiently manage context budgets, understand compressed tool outputs,
  minimize token consumption on heavy logs/file dumps, and selectively retrieve full content only when needed.
---

# 🧠 Headroom: Context Optimization & Token-Reduction Suite

Headroom (`headroomlabs-ai/headroom`) is an open-source, local-first context optimization layer designed for AI coding agents.
It intercepts heavy tool outputs, terminal logs, large file reads, and RAG chunks—compressing them or replacing repetitive sections with compact CCR (Content-Centric Retrieval) markers to conserve context window tokens without degrading reasoning quality.

---

## 🎯 Core Objectives & Tenets

1. **Context Window Protection**: Never flood the agent's context window with thousands of lines of raw terminal logs, stack traces, or monolithic files.
2. **CCR (Content-Centric Retrieval) Literacy**:
   - Recognize and understand compressed blocks and offloaded markers (e.g. `<<ccr:...>>`).
   - Trust the high-density summaries and structure provided in the compressed output.
   - Do **NOT** reflexively invoke retrieval tools unless specific code lines or exact identifiers are strictly required.
3. **Selective & Targeted Inspection**: Read only the relevant line ranges or symbols rather than dumping entire files.
4. **Token Economics**: Maximize reasoning headroom for complex logic, multi-file refactoring, and long-horizon tasks.

---

## 🛠️ Headroom Workflows & Best Practices

### 1. Handling Large Command & Log Outputs
When running commands that output voluminous logs (e.g., test suites, webpack/vite builds, linters):
- **Filter and Grep**: Pipe commands to filter for errors and warnings (e.g., `| Select-String -Pattern "Error|Fail"` or `grep -E "ERR|FAIL"`).
- **Limit Repetition**: If a test failure produces 50 identical stack traces, extract only the first failing case and the summary count.
- **Offload Summarization**: Summarize the test result concisely: `X passed, Y failed with error [ErrorType] at [File:Line]`.

### 2. CCR Literacy (Working with Compressed Markers)
When Headroom compression is active, you may see markers such as:
```
<<ccr:id=9f2a4 length=1840 summary="Webpack bundle analysis: 14 modules chunked into main.js (420kb)">>
```
- **Rule 1 (Trust Summary)**: If the summary contains enough information to answer the question or proceed with the task, continue immediately without re-fetching.
- **Rule 2 (Targeted Retrieval)**: If and only if a specific hash, variable declaration, or line number inside that block is needed to complete the edit, call `headroom_retrieve(id="9f2a4")`.

### 3. File Reading Hygiene
- Prefer targeted reads using `StartLine` and `EndLine` ranges over entire file reads.
- For files over 500 lines, read the interface/type declarations and target function bodies only.

---

## 🔌 Headroom MCP & Proxy Integration (Optional)

If `headroom` is installed locally as an executable or MCP server:
- **Local Proxy Mode**:
  ```bash
  headroom proxy --port 8080
  ```
- **MCP Server**:
  Add `headroom` to your `mcp_config.json`:
  ```json
  {
    "mcpServers": {
      "headroom": {
        "command": "uvx",
        "args": ["headroom-mcp"]
      }
    }
  }
  ```
- **Commands**:
  - `headroom stats`: View token savings and compression ratio across sessions.
  - `headroom learn`: Learn common context patterns to compress more aggressively over time.
