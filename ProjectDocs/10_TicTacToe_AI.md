# 🎮 Tic-Tac-Toe AI — Unbeatable C + SDL2 Game

tags: #project #c #sdl2 #minimax #algorithms #gamedev #desktop #ai

---

## 📌 One-Line Summary
> A graphical, fully playable Tic-Tac-Toe game written in C with SDL2, featuring an AI opponent powered by the Minimax algorithm with Alpha-Beta Pruning — mathematically guaranteed to never lose — packaged as a distributable `.deb` package.

---

## 📂 Location
`~/aathi/Desktop_App/TIC_TAC_TOE/`
`~/aathi/TIC_TAC_TOE.deb` ← Packaged Debian installer (8.3MB)

---

## 🏗️ Architecture

```
┌──────────────────────────────────────┐
│        SDL2 Graphics Window          │
│   (2D rendering, event loop)         │
│                                      │
│  ┌────────────┐  ┌────────────────┐  │
│  │ Game Board │  │  Score / UI   │  │
│  │  (3x3)     │  │  Panels       │  │
│  └────────────┘  └────────────────┘  │
└──────────┬───────────────────────────┘
           │ User click / AI move
           ▼
┌──────────────────────────────────────┐
│         Game Logic Layer             │
│   - Move validation                  │
│   - Win/draw detection               │
│   - Turn management                  │
└──────────┬───────────────────────────┘
           │ When AI's turn
           ▼
┌──────────────────────────────────────┐
│       Minimax Algorithm              │
│   + Alpha-Beta Pruning               │
│                                      │
│   Explores all possible game states  │
│   Maximizes AI score (X)             │
│   Minimizes player score (O)         │
│   Alpha-Beta cuts irrelevant branches│
│   → Returns OPTIMAL move always      │
└──────────────────────────────────────┘
           │
           ▼
┌──────────────────────────────────────┐
│        SDL2 Audio System             │
│   Background music + Sound effects   │
│   (SDL audio API)                    │
└──────────────────────────────────────┘
```

---

## 🛠️ Technology Stack

| Component | Technology |
|-----------|-----------|
| Language | C (systems-level programming) |
| Graphics | SDL2 (Simple DirectMedia Layer) |
| Audio | SDL2 audio API |
| AI Algorithm | Minimax + Alpha-Beta Pruning |
| Build System | Makefile |
| Distribution | Debian `.deb` package (8.3MB) |
| Platform | Linux (packaged) + Windows (SDL2.dll included) |

---

## ✅ Key Features

### 🤖 AI: Minimax with Alpha-Beta Pruning

**Minimax Algorithm:**
- Recursive game-tree search algorithm
- Explores all possible future game states
- AI maximizes its own score, minimizes player's score
- **Result: AI is mathematically unbeatable**

**Alpha-Beta Pruning:**
- Optimization of Minimax — prunes branches that cannot affect the final decision
- Reduces search space from O(b^d) to O(b^(d/2))
- Significantly reduces AI response time (near-instant)

**Guarantees:**
- Against optimal play: game always ends in draw
- Against suboptimal play: AI wins every time
- Never makes a mistake — correct by mathematical proof

### 🎨 SDL2 Graphics
- 2D rendered game board
- Visual feedback for moves
- Game state display (whose turn, win/draw message)
- Background music + sound effects via SDL audio

### 📦 Distribution
- `TIC_TAC_TOE.deb` (8.3MB) — Installable Debian package
- `SDL2.dll` included for Windows compatibility
- `Makefile` for source builds

---

## 📁 File Structure

```
Desktop_App/TIC_TAC_TOE/
├── Makefile              ← Build system
├── SDL2.dll              ← Windows SDL2 runtime
├── a                     ← Compiled binary (21KB)
├── DEBIAN/               ← Debian packaging metadata
└── usr/                  ← Installation target paths
    ├── local/            ← Binary + data files
    └── share/            ← Desktop entry, icons

~/aathi/
├── TIC_TAC_TOE.deb       ← Distributable package (8.3MB)
└── Tic-Tac-Toe_icon.bmp  ← Application icon (3MB)
```

---

## 🔧 How to Build & Run

```bash
# Build from source
cd Desktop_App/TIC_TAC_TOE
make

# Install from .deb package (Linux)
sudo dpkg -i ~/aathi/TIC_TAC_TOE.deb

# Run
./a    # or via installed .desktop entry
```

---

## 🧮 Algorithm Details

```
minimax(board, depth, isMaximizing, alpha, beta):
    if terminal(board):
        return score(board)
    
    if isMaximizing:  # AI's turn
        best = -infinity
        for each empty cell:
            make move
            val = minimax(board, depth+1, false, alpha, beta)
            undo move
            best = max(best, val)
            alpha = max(alpha, best)
            if beta <= alpha: break  # Prune!
        return best
    
    else:  # Player's turn (minimize)
        best = +infinity
        for each empty cell:
            make move
            val = minimax(board, depth+1, true, alpha, beta)
            undo move
            best = min(best, val)
            beta = min(beta, best)
            if beta <= alpha: break  # Prune!
        return best
```

---

## 💡 Resume Bullet Points

- Built a **graphical Tic-Tac-Toe game** in **C** using **SDL2** for 2D rendering, audio, and event handling
- Implemented the **Minimax algorithm** with **Alpha-Beta Pruning** — creating a mathematically unbeatable AI opponent that guarantees optimal play
- Packaged the application as a distributable **Debian `.deb` package** (8.3MB) for Linux deployment
- Applied Alpha-Beta Pruning to reduce AI search time from O(b^d) to O(b^(d/2)), achieving near-instant move generation

---

## 🏷️ Tags
`#c` `#sdl2` `#minimax` `#alphabeta` `#gameai` `#algorithms` `#linux` `#debian` `#gamedev`

---

## 🔗 Links
- [[00_INDEX]]
- [[HTShare]]
