# Vim & Neovim Cheatsheet

A quick reference guide for the essential commands in Vim and Neovim.

---

## Modes

*   **Normal Mode:** For navigation and manipulation of text. Press `<ESC>` to enter.
*   **Insert Mode:** For typing text. Press `i`, `a`, `o` (and their uppercase variants) to enter.
*   **Visual Mode:** For selecting text. Press `v`, `V`, or `Ctrl+v` to enter.

---

## 1. The Essentials: Getting In & Out

| Command | Description |
| :--- | :--- |
| `:w` | Save the current file. |
| `:q` | Quit the current file. |
| `:wq` | Save and quit. |
| `:q!` | Quit without saving changes. |
| `:w {filename}` | Save the current content to a new file named `{filename}`. |
| `:r {filename}` | Insert the content of `{filename}` below the cursor. |
| `:r !{cmd}` | Execute `{cmd}` and insert its output below the cursor (e.g., `:r !date`). |

---

## 2. Movement

| Command | Description |
| :--- | :--- |
| `h`, `j`, `k`, `l` | Move left, down, up, right. |
| `w` | Move to the start of the next word. |
| `b` | Move to the start of the previous word. |
| `e` | Move to the end of the current word. |
| `^` or `0` | Move to the beginning of the line. |
| `$` | Move to the end of the line. |
| `gg` | Go to the first line of the file. |
| `G` | Go to the last line of the file. |
| `:{n}` or `{n}G` | Go to line number `{n}`. |
| `Ctrl+o` | Go to the previous location (jump back). |
| `Ctrl+i` | Go to the next location (jump forward). |
| `%` | Jump to the matching parenthesis, bracket, or brace. |

---

## 3. Editing

| Command | Description |
| :--- | :--- |
| `i` | Enter Insert mode before the cursor. |
| `a` | Enter Insert mode after the cursor. |
| `I` | Enter Insert mode at the beginning of the line. |
| `A` | Enter Insert mode at the end of the line. |
| `o` | Open a new line below the cursor and enter Insert mode. |
| `O` | Open a new line above the cursor and enter Insert mode. |
| `r{char}` | Replace the character under the cursor with `{char}`. |
| `R` | Enter Replace mode (overwrite text). |
| `u` | Undo the last change. |
| `Ctrl+r` | Redo the last undone change. |
| `.` | Repeat the last command. |

---

## 4. Deleting & Changing Text

The `d` (delete), `c` (change), and `y` (yank) commands are powerful when combined with movements.

| Command | Description |
| :--- | :--- |
| `x` | Delete the character under the cursor. |
| `dw` | Delete from the cursor to the end of the word. |
| `dd` | Delete the current line. |
| `d$` or `D` | Delete from the cursor to the end of the line. |
| `cw` | Change (delete and enter Insert mode) from the cursor to the end of the word. |
| `cc` | Change (delete and enter Insert mode) the entire line. |
| `c$` or `C` | Change from the cursor to the end of the line. |
| `ciw` | Change the inner word (the word under the cursor). |
| `diw` | Delete the inner word. |

---

## 5. Cut, Copy & Paste (Yanking)

| Command | Description |
| :--- | :--- |
| `yw` | Yank (copy) the current word. |
| `yy` | Yank (copy) the current line. |
| `y$` | Yank from the cursor to the end of the line. |
| `p` | Paste the copied/deleted text after the cursor. |
| `P` | Paste before the cursor. |

---

## 6. Searching & Replacing

| Command | Description |
| :--- | :--- |
| `/{pattern}` | Search forward for `{pattern}`. |
| `?{pattern}` | Search backward for `{pattern}`. |
| `n` | Repeat the last search in the same direction. |
| `N` | Repeat the last search in the opposite direction. |
| `:s/old/new/g` | Substitute `new` for `old` on the current line (globally). |
| `:%s/old/new/g` | Substitute `new` for `old` in the entire file. |
| `:%s/old/new/gc` | Substitute with confirmation for each occurrence in the file. |

---

## 7. Visual Mode

Enter with `v` (character-wise), `V` (line-wise), or `Ctrl+v` (block-wise).

| Command | Description |
| :--- | :--- |
| `v` | Enter visual mode (character selection). |
| `V` | Enter visual line mode (select whole lines). |
| `Ctrl+v` | Enter visual block mode (select a rectangular block). |
| `d` | Delete the selected text. |
| `y` | Yank (copy) the selected text. |
| `>` | Indent the selected text. |
| `<` | Un-indent the selected text. |

---

## 8. Surround (with vim-surround plugin)

A popular plugin for changing surrounding characters.

| Command | Description |
| :--- | :--- |
| `ysiw"` | Surround the inner word with double quotes. |
| `cs"'` | Change surrounding `"` to `'`. |
| `ds"` | Delete surrounding `"`. |
| `S"` | In visual mode, surround the selection with double quotes. |

---

This cheatsheet covers the most common commands to get you productive in Vim/Neovim. Happy coding!
