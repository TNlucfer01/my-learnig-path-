# Cloud Free Tier Hosting & Migration Guide

This guide provides step-by-step instructions to take your application (React/Vite Frontend, Node.js/Express Backend, and MySQL Database) from your local machine to the cloud absolutely free for testing purposes.

## Architecture & Recommended Free Platforms

Based on your tech stack, here are the best free platforms to use:

1. **Frontend (React + Vite):** [Vercel](https://vercel.com) or [Netlify](https://netlify.com). Both offer excellent, permanent free tiers for static frontend apps.
2. **Backend (Node.js, Express, Sequelize):** [Render](https://render.com) or [Koyeb](https://koyeb.com). Render's free tier is the standard for testing (note: it spins down after 15 mins of no traffic and takes ~50s to wake up).
3. **Database (MySQL):** [Aiven](https://aiven.io/mysql) or [TiDB Serverless](https://en.pingcap.com/tidb-cloud). Both offer fully free MySQL-compatible databases without requiring a credit card for the free tier.

---

## Step 1: Database Setup & Migration

### 1.1 Create the Cloud Database
1. Go to [Aiven](https://aiven.io/) and sign up.
2. Create a new service and select **MySQL**.
3. Choose the "Free Plan" (if available in your region) or go to [TiDB Cloud](https://tidbcloud.com/) and create a free Serverless Cluster (this is highly recommended for MySQL compatibility and generous free limits).
4. Once deployed, get your connection credentials: Host, Port, User, Password, and Database Name.

### 1.2 Migrate Your Local Schema & Data
Since you are using Sequelize, your backend might automatically recreate the schema if you use `sequelize.sync()`. However, to move your *existing data*:

**Export local database:**
Open your terminal and use `mysqldump`:
```bash
mysqldump -u root -p your_local_db_name > local_backup.sql
```

**Import to the cloud database:**
Run the following command using the credentials provided by TiDB/Aiven:
```bash
mysql -h <cloud_host> -P <cloud_port> -u <cloud_user> -p <cloud_db_name> < local_backup.sql
```
*(Alternatively, you can use a GUI like DBeaver or MySQL Workbench: connect to the cloud DB and use the "Restore" or "Import" function).*

---

## Step 2: Backend Deployment (Render)

### 2.1 Prepare Your Backend Code
1. Ensure your `Back/` folder has its own Git repository or is part of a monorepo. Render connects directly to GitHub.
2. Push your code to a GitHub repository.
3. Keep your `package.json` configurations intact. Render will run `npm install` and then your start command. Your `start` command should ideally be `node server.js` (instead of nodemon, which is for dev).

*Optional: Add this start script to your `package.json`:*
```json
"scripts": {
  "start": "node server.js",
  "dev": "nodemon server.js",
  "test": "nodemon server.js"
}
```

### 2.2 Deploy on Render
1. Go to [Render.com](https://render.com/) and log in with GitHub.
2. Click **New +** -> **Web Service**.
3. Connect your GitHub repository. (If it's a monorepo, specify the "Root Directory" as `Back`).
4. **Environment:** Node
5. **Build Command:** `npm install`
6. **Start Command:** `npm start` (or `node server.js`)
7. **Instance Type:** Free
8. **Environment Variables:** Add all variables from your local `.env` file (e.g., `DB_HOST`, `DB_USER`, `DB_PASS`, `DB_NAME`, `JWT_SECRET`, Twilio credentials, etc.). Remember to replace your local DB connection strings with the new Cloud DB credentials!
9. Click **Create Web Service**. Wait for the build. You'll receive a URL like `https://donbosco-backend.onrender.com`.

---

## Step 3: Frontend Deployment (Vercel)

### 3.1 Prepare Your Frontend Code
1. Your frontend uses Vite, so the build command is `npm run build` and output directory is `dist`.
2. Update your API calls. Somewhere in your frontend code (perhaps an `.env` file or an axios instance), you refer to `http://localhost:<YOUR_PORT>`. Change this to your new Render Backend URL (e.g., `https://donbosco-backend.onrender.com`).
3. Push these changes to GitHub.

### 3.2 Deploy on Vercel
1. Go to [Vercel.com](https://vercel.com) and log in with GitHub.
2. Click **Add New...** -> **Project**.
3. Import your GitHub repository. (If it's a monorepo, set the "Root Directory" to `Front`).
4. Vercel will auto-detect Vite. 
5. Ensure:
   - Build Command: `npm run build`
   - Output Directory: `dist`
6. Click **Deploy**. Vercel will build and host your frontend, giving you a live URL.

---

## Summary of Sequence

1. **Database:** Create TiDB / Aiven MySQL -> Export local DB -> Import to Cloud DB.
2. **Backend:** Update DB credentials in Render's Environment Variables -> Deploy Node.js server.
3. **Frontend:** Update the base URL pointing to the new Render backend -> Deploy React app on Vercel.

**Note on Free Tiers Limitations:**
- Render's free backend will "sleep" after 15 minutes of inactivity. The next time you open the app, it might take 30-50 seconds for the backend to wake up. This is normal for free hosting.
