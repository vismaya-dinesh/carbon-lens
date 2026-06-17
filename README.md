# 🌿 CarbonLens — Personal Carbon Footprint Tracker

> Understand, track, and reduce your environmental impact through guided input, live calculations, and personalized insights.

![CarbonLens](https://img.shields.io/badge/status-live-brightgreen) ![Zero Dependencies](https://img.shields.io/badge/dependencies-zero-blue) ![License](https://img.shields.io/badge/license-MIT-green)

**Live App:** https://carbonlens-r7mwrtneqq-uc.a.run.app/

---

## Overview

CarbonLens is a single-file React application that gives individuals a clear picture of their daily carbon footprint — and concrete steps to reduce it. It covers four major emission categories (Transport, Food, Energy, Shopping), calculates CO₂e in real time using IPCC-sourced emission factors, and surfaces personalized reduction tips ranked by impact.

No sign-up. No tracking. No build step. Open it and start logging.

---

## Features

### 🧭 Onboarding Profile
Set your baseline context — country, household size, diet type, and primary transport mode — so insights are relevant to your actual lifestyle from the first entry.

### 📋 Daily Activity Logger
Log activities across four categories:

| Category | Examples |
|---|---|
| 🚗 Transport | Car, flight, public transit, cycling |
| 🥩 Food | Beef, chicken, vegetarian, vegan meals |
| ⚡ Energy | Electricity (kWh), gas heating (therms) |
| 🛍️ Shopping | New clothing, electronics, secondhand items |

### 📊 Live Dashboard
- **Footprint gauge** — circular score showing your daily total vs. the 6.3 kg CO₂e global average target
- **Color system** — green (<4 kg), amber (4–8 kg), red (>8 kg) applied consistently across all indicators
- **Donut chart** — inline SVG breakdown by category with hover tooltips showing exact values
- **Delta badges** — your per-category footprint vs. the global average

### 💡 Personalized Insights Engine
After every log entry, CarbonLens recalculates your top 3 reduction tips based on your highest-emission activities. Each tip shows:
- The specific action to take
- Estimated CO₂ saving (kg)
- Difficulty level (Easy / Medium / Hard)
- A one-line explanation tied to what you actually logged

No generic advice. If you logged a beef meal, it suggests the plant-based swap and shows you the exact saving.

### 📈 Weekly Progress
A 7-day sparkline chart (inline SVG) compares this week's daily totals against last week's — so you can see your habits trending in the right direction.

---

## Emission Factors

All factors sourced from **IPCC AR6 (2022)** and peer-reviewed lifecycle analyses:

| Activity | Factor |
|---|---|
| Car travel | 0.21 kg CO₂e / km |
| Flight | 0.255 kg CO₂e / km |
| Public transit | 0.089 kg CO₂e / km |
| Cycling | 0 kg CO₂e |
| Beef meal | 6.61 kg CO₂e |
| Chicken meal | 1.84 kg CO₂e |
| Vegetarian meal | 0.61 kg CO₂e |
| Vegan meal | 0.39 kg CO₂e |
| Electricity | 0.233 kg CO₂e / kWh |
| Gas heating | 2.04 kg CO₂e / therm |
| New clothing item | 10 kg CO₂e |
| Electronics | 70 kg CO₂e |
| Secondhand item | 1.5 kg CO₂e |

---

## Technical Details

### Stack
- **React** (loaded via CDN — no build step)
- **Zero external dependencies** — all charts are inline SVG
- **localStorage** for persistence across sessions (with safe fallback for private browsing)

### Architecture
```
State Layer       useReducer — single source of truth for all activities, history, goals
Calculation Layer useMemo — footprint totals, category breakdowns, peer comparisons
UI Layer          Functional components with destructured props, keyboard-navigable
Data Layer        Typed emission factor constants with source citations
```

### Data Persistence
- Activity logs are saved to `localStorage` on every state change
- On load, data is rehydrated with a `try/catch` guard for private-browsing environments
- Entries older than 7 days are automatically expired on load

### Input Safety
- Negative values and non-numeric input are rejected with inline field errors
- Unrealistic inputs (e.g. >2000 km/day) trigger a user-facing warning
- All `localStorage` access is wrapped in `try/catch`

---

## Accessibility

- All interactive elements are fully keyboard-navigable with visible focus rings
- SVG charts include `aria-label` and `role="img"` with text descriptions
- Color is never the sole indicator — paired with icons (🟢 🟡 🔴) and text labels
- Respects `prefers-reduced-motion` — SVG animations are disabled when set

---

## Getting Started

### Use the live app
Visit **https://carbonlens-r7mwrtneqq-uc.a.run.app/** in any modern browser.

### Run locally
Download the single HTML file and open it directly — no server, no install, no build:

```bash
open carbonlens.html
```

---

## Project Structure

```
carbonlens.html          # The entire application — HTML + CSS + React in one file
README.md                # This file
```

---

## Contributing

Issues and pull requests are welcome. When contributing:
- Keep all logic in the single-file format (no bundler)
- Document any new emission factors with their source
- Run the app in both a standard and private browsing window before submitting

---


*Built for the Google PromptWars Antigravity Challenge.*
