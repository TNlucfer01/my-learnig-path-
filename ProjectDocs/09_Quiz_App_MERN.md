# 📝 Quiz App — MERN Stack Survey Application

tags: #project #web #mern #react #nodejs #express #mongodb #fullstack

---

## 📌 One-Line Summary
> A full-stack MERN quiz/survey application with a Node.js + Express REST API backend (MongoDB), a React + Tailwind CSS frontend, random question selection, and answer submission — built as a complete end-to-end web app.

---

## 📂 Location
`~/aathi/Web/MERN/Survey/`

---

## 🏗️ Architecture

```
┌────────────────────────────────┐
│    React Frontend              │
│    (Survey/front/ — Vite)      │
│    Quiz UI, Question display   │
│    Answer submission           │
└───────────────┬────────────────┘
                │ HTTP REST (CORS enabled)
                │ /api/questions/*
                ▼
┌────────────────────────────────┐
│    Express.js Backend          │
│    (Survey/backend/server.js)  │
│    API: Quiz Application v1.0  │
└───────┬──────────────┬─────────┘
        │              │
   ┌────▼────┐   ┌─────▼─────┐
   │ MongoDB │   │  Routes   │
   │  Atlas  │   │ /api/ques-│
   └─────────┘   │ tions     │
                 │ /random   │
                 │ /submit   │
                 └───────────┘
```

---

## 🛠️ Technology Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18 + Vite |
| Frontend Styling | Tailwind CSS |
| Backend | Node.js + Express.js |
| Database | MongoDB (Mongoose ODM) |
| API Style | REST |
| Environment Config | dotenv |
| CORS | cors middleware |

---

## ✅ Key Features

### 🔌 Backend API (`backend/server.js`)
Exposes these endpoints:

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/questions` | GET | Fetch all questions |
| `/api/questions/random` | GET | Fetch random question set |
| `/api/questions/submit` | POST | Submit answers |
| `/` | GET | API info + version |

- **MongoDB connection** via `connectDatabase()` (config/database.js)
- **Error handling:** 404 handler + global error middleware
- **Body parsing:** JSON + URL-encoded
- **CORS:** Enabled for all routes (for frontend-backend separation)
- **Port:** 5000 (configurable via `.env`)

### 🗃️ Database Seeding
- `seedDB.js` (4.2KB) — Script to populate MongoDB with initial questions
- Question schema defined in `models/`
- Routes defined in `routes/questionRoutes.js`

### 🎨 Frontend (`front/`)
- Built with React 18 + Vite + Tailwind CSS
- Quiz flow: display questions → accept answers → submit → view results
- Responsive design

---

## 📁 File Structure

```
Survey/
├── backend/
│   ├── server.js           ← Express app (58 lines, 1.4KB)
│   ├── package.json
│   ├── .env                ← MongoDB URI, PORT, NODE_ENV
│   ├── config/
│   │   └── database.js     ← MongoDB connection
│   ├── controllers/        ← Route handler logic
│   ├── models/             ← Mongoose schemas
│   ├── routes/
│   │   └── questionRoutes.js
│   └── seedDB.js           ← Database seeder (4.2KB)
└── front/
    ├── index.html
    ├── index.css
    ├── vite.config.js
    ├── tailwind.config,js
    ├── package.json
    └── src/                ← React components
```

---

## 🔧 How to Run

```bash
# Backend
cd backend
npm install
# Set up .env: MONGODB_URI, PORT=5000, NODE_ENV=development
npm start

# Frontend (in another terminal)
cd front
npm install
npm run dev
# → http://localhost:5173
```

---

## 💡 Resume Bullet Points

- Built a **full-stack MERN quiz application** with a **Node.js + Express** REST API backend and **React + Vite + Tailwind** frontend
- Designed RESTful API with **4 endpoints** (fetch all, random selection, submit answers, API info) with proper middleware: CORS, JSON body parsing, 404 and global error handlers
- Integrated **MongoDB** via Mongoose with a database seeding script for initial question population
- Implemented **environment-based configuration** with dotenv for secure credential management

---

## 🏷️ Tags
`#mern` `#nodejs` `#express` `#mongodb` `#react` `#tailwind` `#restapi` `#fullstack`

---

## 🔗 Links
- [[00_INDEX]]
- [[Neon Monolith]]
- [[Vajra E-Commerce SPA]]
