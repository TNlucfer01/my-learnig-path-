# 🖤 Neon Monolith — Premium Tech Store UI

tags: #project #web #react #typescript #vite #framermotion #ui #freelance #gemini

---

## 📌 One-Line Summary
> A visually premium, animated tech hardware store single-page application built with React + TypeScript and Framer Motion — originally scaffolded from Google AI Studio and extended into a full product showcase.

---

## 📂 Location
`~/aathi/Web/MERN/neon-monolith/`

---

## 🏗️ Architecture

```
Neon Monolith (React SPA)
├── Navbar (tab-based navigation)
├── Pages (animated with Framer Motion AnimatePresence)
│   ├── Showroom  ← Hero + featured products grid
│   ├── Catalog   ← Full product listing with filters
│   ├── Protocols ← Support/warranty/shipping info
│   └── Origin    ← Brand story / about page
└── Footer         ← Links, social, copyright
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | TypeScript |
| Framework | React 18 |
| Build Tool | Vite |
| Animations | Framer Motion (`motion/react`) |
| Styling | Tailwind CSS |
| State Management | React `useState` hooks |
| AI Scaffolding | Google AI Studio (`gemini-2.5-flash`) |
| API Integration | Gemini API (`GEMINI_API_KEY`) |

---

## ✅ Key Features

### 🎨 Premium UI Design
- Dark theme with neon accent colors (`monolith-gradient`)
- **Framer Motion** `AnimatePresence` with fade + slide transitions between pages
- Custom typography with tight tracking (`font-headline`)
- Selection highlighting: `selection:bg-primary selection:text-on-primary`

### 🛍️ Product Catalog (9 Products)

| Product | Category | Price |
|---------|----------|-------|
| Xenon Pro X-1 | Laptops | $3,499 |
| Prism 49" Ultra | Monitors | $1,899 |
| Monolith Deck v2 | Peripherals | $249 |
| Titan 16 Workstation | Laptops | $4,299 |
| Atom Air 13 | Laptops | $1,699 |
| Monolith Tower Core | Workstations | $5,999 |
| Echo-X Studio | Audio | $499 |
| Cylinder One | Audio | $329 |
| Nova Buds | Audio | $199 |

### 📊 Brand Stats
- Units Forged: 12K+
- Uptime Reliability: 99.9%
- Design Awards: 45
- Concierge Support: 24/7

### 🧭 Page Structure
- **Showroom:** Hero banner + curated product grid with `onNavigate` callback
- **Catalog:** Full product listing (all categories)
- **Protocols:** Support center, custom builds, warranty, shipping
- **Origin:** Mission, principles, brand story

---

## 📁 File Structure

```
neon-monolith/
├── index.html
├── vite.config.ts
├── tsconfig.json
├── package.json
├── .env.example       ← GEMINI_API_KEY
├── metadata.json      ← AI Studio app metadata
└── src/
    ├── App.tsx        ← Root component (tab routing, AnimatePresence)
    ├── main.tsx       ← React DOM entry
    ├── index.css      ← Global styles
    ├── constants.ts   ← Products, Stats, Principles data (106 lines)
    ├── types.ts       ← TypeScript interfaces
    ├── components/
    │   ├── Navbar.tsx
    │   └── Hero.tsx
    └── pages/
        ├── Showroom.tsx
        ├── Catalog.tsx
        ├── Protocols.tsx
        └── Origin.tsx
```

---

## 🔧 How to Run

```bash
npm install
cp .env.example .env.local
# Add GEMINI_API_KEY to .env.local
npm run dev
# → Visit http://localhost:5173
```

---

## 💡 Resume Bullet Points

- Built a **premium tech hardware store** SPA using **React + TypeScript + Vite** with smooth **Framer Motion** page transitions (`AnimatePresence`)
- Implemented tab-based navigation with animated route switching (fade + vertical slide, 400ms `easeInOut`)
- Designed a dark-themed UI with custom Tailwind configuration, brand color tokens, and neon gradient system
- Scaffolded from **Google AI Studio** (`gemini-2.5-flash`) and extended with a complete multi-page product experience

---

## 🏷️ Tags
`#react` `#typescript` `#vite` `#framermotion` `#tailwind` `#spa` `#darktheme` `#premiumUI` `#aiStudio`

---

## 🔗 Links
- [[00_INDEX]]
- [[Vajra E-Commerce SPA]]
- [[Quiz App (Survey)]]
