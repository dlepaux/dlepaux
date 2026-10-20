## David Lepaux

**AI Engineer and Engineering Lead** in Lausanne, Switzerland. I build LLM agents that act safely on real systems: MCP servers, per-person auth, confirmation before any write. Before that, 13 years of web platforms for luxury, sports, e-commerce and media.

Started writing code professionally in 2013. Still hands-on by choice, every day. Web in React, Next.js and TypeScript. Services and systems in Rust (lower-level primitives, the parts you only see when the runtime stops helping).

**Worked with** FIBA · Visilab · Patek Philippe · Lausanne Tourisme · Publishing Factory

---

### Household AI assistant

A chat assistant that acts as each person in a household (their own token, every action filed in their name) and asks before anything changes. Few deliberate tools, each person's language, failures counted and alerting. Media is the test bed. The pattern is the point.

[**kavita-mcp**](https://github.com/dlepaux/kavita-mcp) — MCP server in Rust. Search your Kavita libraries and send a book to your Kindle, as yourself, after a confirmation.

[![stars](https://img.shields.io/github/stars/dlepaux/kavita-mcp?style=flat&color=yellow)](https://github.com/dlepaux/kavita-mcp)

[**seerr-mcp**](https://github.com/dlepaux/seerr-mcp) — MCP server in Rust. Search and request films and series in Seerr, as yourself, after a confirmation.

[![stars](https://img.shields.io/github/stars/dlepaux/seerr-mcp?style=flat&color=yellow)](https://github.com/dlepaux/seerr-mcp)

---

### Open Source

[**realtime-bpm-analyzer**](https://github.com/dlepaux/realtime-bpm-analyzer) — Zero-dependency TypeScript library for real-time BPM detection via the Web Audio API. Used in music players, DJ tools, and streaming services.

[![npm downloads](https://img.shields.io/npm/dm/realtime-bpm-analyzer?style=flat&label=downloads&color=CB3837)](https://www.npmjs.com/package/realtime-bpm-analyzer) [![stars](https://img.shields.io/github/stars/dlepaux/realtime-bpm-analyzer?style=flat&color=yellow)](https://github.com/dlepaux/realtime-bpm-analyzer)

[**docker-exporter**](https://github.com/dlepaux/docker-exporter) — Lightweight Rust Prometheus exporter for Docker container metrics. Built for ARM64 + cgroup v2, multi-arch image on GHCR.

<!-- downloads: GHCR exposes no public pull-count API. Currently sourced from ghcr-badge.elias.eu.org (live HTML-scrape of the package page's "Total downloads"; a layer-download tally, not unique pulls). backage (ipitio/backage) is starred and will serve sturdier static JSON at https://ipitio.github.io/backage/dlepaux/docker-exporter.json (query $.downloads) once its crawler indexes — swap the url below to it then. -->
[![ghcr downloads](https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fghcr-badge.elias.eu.org%2Fapi%2Fdlepaux%2Fdocker-exporter&query=%24.downloadCount&style=flat&label=downloads&color=2496ED)](https://github.com/dlepaux/docker-exporter/pkgs/container/docker-exporter) [![stars](https://img.shields.io/github/stars/dlepaux/docker-exporter?style=flat&color=yellow)](https://github.com/dlepaux/docker-exporter)

---

### 3D printing

Parametric cases in OpenSCAD, printed and tested. Each loop is rendered from the CAD itself, pulled apart by its own assembly parameter.

<table>
<tr>
<td width="50%"><a href="https://dlepaux.github.io/pi5-runners/"><img src="assets/pi5-runners-holo.gif" alt="pi5-runners: three stacked Pi 5 modules separating and clicking back together, drawn as a hologram"></a></td>
<td width="50%"><a href="https://dlepaux.github.io/hexrack-sbc/"><img src="assets/hexrack-sbc-holo.gif" alt="hexrack-sbc: a hexagonal SBC enclosure separating front to back into its printed sections, drawn as a hologram"></a></td>
</tr>
<tr>
<td valign="top"><a href="https://dlepaux.github.io/pi5-runners/"><b>pi5-runners</b></a><br>A stack for three Raspberry Pi 5s running as GitHub Actions runners. One 40 mm Noctua per module, nothing screwed together but the fans, every part prints without supports.</td>
<td valign="top"><a href="https://github.com/dlepaux/hexrack-sbc"><b>hexrack-sbc</b></a><br>A modular honeycomb rack, one SBC per unit behind a 92 mm Noctua. The configurator engraves labels with real OpenSCAD compiled to WebAssembly.</td>
</tr>
</table>

---

### Stack

**Day to day**

![Rust](https://img.shields.io/badge/Rust-000?style=flat&logo=rust&logoColor=white) ![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat&logo=typescript&logoColor=white) ![React](https://img.shields.io/badge/React-61DAFB?style=flat&logo=react&logoColor=black) ![Next.js](https://img.shields.io/badge/Next.js-000?style=flat&logo=next.js&logoColor=white) ![Node.js](https://img.shields.io/badge/Node.js-339933?style=flat&logo=node.js&logoColor=white) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white) ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat&logo=docker&logoColor=white)

**Infra and AI**

![MCP](https://img.shields.io/badge/MCP-000?style=flat&logo=modelcontextprotocol&logoColor=white) ![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=flat&logo=ansible&logoColor=white)

**By volume** (public + private repos)

![Top Languages](https://stats.lepaux.com/api/top-langs/?username=dlepaux&count_private=true&layout=compact&hide=html,css&theme=github_dark&card_width=846&v=2)

---

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/david-lepaux) [![Website](https://img.shields.io/badge/david.lepaux.com-000?style=flat&logo=safari&logoColor=white)](https://david.lepaux.com)
