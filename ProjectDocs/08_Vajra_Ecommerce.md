# 🪙 Vajra — Indian E-Commerce SPA (Freelance)

tags: #project #web #react #vite #tailwind #freelance #ecommerce #spa

---

## 📌 One-Line Summary
> A mobile-first, black-and-gold themed Single Page Application for **Vajra**, an Indian premium brand selling authentic Karungali wood products and natural scents — with a UPI-based purchase flow and Google Form order management.

---

## 📂 Location
`~/aathi/Web/MERN/Vajra/`

---

## 🏗️ Architecture

```
Vajra SPA (React + Vite)
├── Sections (single-page scroll):
│   ├── Home / Hero
│   ├── About Vajra
│   ├── Products
│   │   ├── Karungali Collection
│   │   └── Scents Collection
│   ├── Purchase Flow (Modal-based)
│   │   ├── Step 1: Product + address form
│   │   ├── Step 2: UPI QR code + amount
│   │   └── Step 3: Google Form submission
│   ├── FAQ
│   ├── Shipping & Returns
│   ├── Privacy Policy
│   └── Contact / Footer
└── Floating WhatsApp button
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | JavaScript |
| Framework | React 18 |
| Build Tool | Vite |
| Styling | Tailwind CSS |
| Theme | Black + Gold |
| Logo | Custom brand asset |
| Payment | UPI (manual verification) |
| Order Management | Google Forms + Google Sheets |
| Hosting | Netlify / Vercel (planned) |

---

## ✅ Product Domain

### Brand: Vajra
- **Niche:** Authentic Indian traditional products
- **Collections:**
  - **Karungali** — Authentic black wood (Ebony) products (religious/wellness items)
  - **Scents** — Natural fragrances and incense

### 🎨 Design System
- **Color Palette:** Black (`#000000`) + Gold (`#FFD700` range)
- **Logo:** Custom Vajra brand logo (`image.png`)
- **Typography:** Premium, minimal
- **Mobile-first:** Fully responsive (India's mobile-dominant market)

---

## 🛒 Purchase Flow (Designed)

```
1. "Buy Now" button → Modal opens
   └── Product summary + Price

2. Customer fills:
   └── Shipping address (name, phone, full address, pincode, city, state)

3. Modal updates:
   └── Total amount (product + shipping)
   └── UPI QR code (dynamic)
   └── UPI ID (one-click copy)
   └── "Pay exact amount, note your UTR/Transaction ID"

4. Customer pays → clicks "I have paid"
   └── Redirects to pre-filled Google Form:
       - Product name, Quantity, Address (auto-filled)
       - UTR / Transaction ID field
       - Payment screenshot upload

5. Success page:
   └── Order reference number
   └── Estimated delivery: 3-4 days (TN), 5-7 days (pan-India)
```

---

## 📋 Requirements Analysis (Requirement.md)

The `Requirement.md` file (6.3KB) contains:
1. **Original requirements analysis** — identifying 5 categories of gaps:
   - Functional & Feature Gaps (no cart, no stock visibility)
   - UX Loopholes (no search, no zoom, no wishlist)
   - Technical Gaps (SEO, analytics, performance targets)
   - Security/Legal Issues (UPI fraud risk, PII, GST invoicing)
   - Business/Operational Gaps (no auto-confirmation, no admin dashboard)

2. **Refined requirements** — complete professional spec including:
   - All product display fields (images, benefits, usage, origin)
   - WhatsApp floating button for instant support
   - SEO meta tags and product schema markup
   - Google Analytics 4 integration
   - Policies: Shipping, Returns (7-day), Privacy, Terms

---

## 📁 File Structure

```
Vajra/
├── index.html
├── vite.config.js
├── tailwind.config.js
├── package.json
├── eslint.config.js
├── README.md
├── Requirement.md     ← Full requirements analysis (6.3KB)
└── src/               ← React components
```

---

## 💡 Resume Bullet Points

- Built a **mobile-first e-commerce SPA** for Indian brand **Vajra** using **React + Vite + Tailwind CSS** with a premium black-and-gold design system
- Designed a **multi-step UPI purchase modal flow**: address collection → dynamic QR code generation → Google Form order submission
- Conducted comprehensive **requirements gap analysis** identifying 25+ functional, UX, technical, legal, and business loopholes with professional remediation recommendations
- Implemented Tailwind-based responsive design targeting India's mobile-dominant user base

---

## 🏷️ Tags
`#react` `#vite` `#tailwind` `#ecommerce` `#spa` `#freelance` `#upi` `#india` `#mobileFirst`

---

## 🔗 Links
- [[00_INDEX]]
- [[Neon Monolith]]
- [[Quiz App (Survey)]]
