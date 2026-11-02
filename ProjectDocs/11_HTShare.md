# 📤 HTShare — Desktop File-Sharing App (Java + JavaFX)

tags: #project #java #javafx #maven #networking #desktop #qrcode #https

---

## 📌 One-Line Summary
> A polished JavaFX desktop application that creates an embedded HTTPS file server on the local network, generates a QR code for instant mobile access, and displays real-time transfer statistics — with dark/light theme support. Packaged as a distributable AppImage.

---

## 📂 Location
`~/aathi/Desktop_App/javafx/HtShare/`
`~/aathi/Desktop_App/javafx/HtShare/HtShare-x86_64.AppImage` ← Packaged app (98.5MB)

---

## 🏗️ Architecture

```
┌────────────────────────────────────────────┐
│            JavaFX GUI (Frontend)            │
│  - File selector / drag-and-drop           │
│  - QR code display (ZXing-generated)       │
│  - Real-time transfer stats dashboard      │
│  - Dark / Light theme toggle               │
└─────────────────────┬──────────────────────┘
                      │ User selects files
                      ▼
┌────────────────────────────────────────────┐
│          NanoHTTPD Embedded Server         │
│  - Spins up HTTPS server on a local port  │
│  - Self-signed SSL certificate            │
│  - Serves files via HTTPS                 │
│  - Handles concurrent file requests       │
└─────────────────────┬──────────────────────┘
                      │
           ┌──────────▼──────────┐
           │   ZXing QR Code     │
           │   Generator         │
           │  → Encodes server   │
           │    URL into QR      │
           │  → Mobile scans QR  │
           │  → Downloads file   │
           └─────────────────────┘
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | Java |
| UI Framework | JavaFX |
| Build Tool | Maven |
| HTTP Server | NanoHTTPD (embedded, lightweight) |
| QR Code | ZXing (Zebra Crossing) library |
| Security | HTTPS with self-signed certificates |
| Packaging | AppImage (Linux — 98.5MB) |
| IDE Support | Eclipse (.metadata present) |

---

## ✅ Key Features

### 🔒 HTTPS with Self-Signed Certificates
- All file transfers secured with HTTPS
- Self-signed certificate generated at runtime
- Mobile devices connect via HTTPS — no plain HTTP

### 📱 QR Code–Based Mobile Access
- ZXing generates a QR code encoding the server's local HTTPS URL
- User scans QR with phone → instant browser download
- No manual IP typing required

### 📊 Real-Time Transfer Statistics
- Live dashboard showing:
  - Files currently being transferred
  - Transfer speed / progress
  - Connected clients
  - Total data transferred

### 🎨 Theme Support
- Dark mode and Light mode
- JavaFX CSS-based theming
- Persistent preference (likely)

### 🌐 Local Network Operation
- No internet required
- Works on WiFi / Ethernet local network
- Multiple simultaneous connections supported (NanoHTTPD handles concurrency)

### 📦 Packaging
- **AppImage** format (Linux) — `HtShare-x86_64.AppImage` (98.5MB)
- Self-contained — includes all dependencies (JRE, JavaFX, libs)
- Run without installation: `./HtShare-x86_64.AppImage`

---

## 📁 File Structure

```
Desktop_App/javafx/
├── HtShare/
│   ├── htshare/           ← Maven project root
│   │   ├── pom.xml        ← Maven build config (dependencies)
│   │   └── src/           ← Java source files
│   │       └── main/
│   │           ├── java/  ← Application code
│   │           └── resources/ ← FXML, CSS, icons
│   └── HtShare-x86_64.AppImage  ← Distributable (98.5MB)
└── myapp/                 ← Alternative/test project
```

---

## 🔧 How to Run

```bash
# Option 1: AppImage (easiest)
chmod +x HtShare-x86_64.AppImage
./HtShare-x86_64.AppImage

# Option 2: Build from source
cd htshare
mvn clean package
java -jar target/htshare.jar
```

---

## 💡 Resume Bullet Points

- Built a **JavaFX desktop file-sharing application** using an **embedded NanoHTTPD HTTPS server** with self-signed SSL certificates for secure local-network file transfers
- Integrated the **ZXing (Zebra Crossing)** library to auto-generate QR codes encoding the server URL, enabling instant mobile access without manual IP configuration
- Implemented a **real-time transfer statistics dashboard** showing live speed, connected clients, and total data transferred
- Developed **dark/light theme switching** using JavaFX CSS theming system
- Packaged the application as a self-contained **Linux AppImage** (98.5MB) for zero-dependency distribution

---

## 🏷️ Tags
`#java` `#javafx` `#maven` `#nanohttpd` `#zxing` `#qrcode` `#https` `#networking` `#desktop` `#appimage`

---

## 🔗 Links
- [[00_INDEX]]
- [[Tic-Tac-Toe AI]]
