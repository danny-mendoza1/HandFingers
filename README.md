

---

# GDScript Formatting Setup

This project uses **[GDScript Formatter](https://github.com/lupoglaz/godot-gdscript-formatter)** (a Godot 4 editor addon) to automatically format GDScript on save. Under the hood, it uses **[GDToolkit](https://github.com/Scony/godot-gdscript-toolkit)**, which is a Python tool installed via `pip`.

> **Key Points**  
> - We install `gdtoolkit` in a **local virtual environment** (`.venv`) so we don’t conflict with system‐wide installations.  
> - The **GDScript Formatter** plugin is already included in our repository under `addons/gdscript_formatter`.  
> - **Format on save** is enabled by default, so after setup, your scripts will be automatically formatted without any extra steps.

## Prerequisites

1. **Python 3** (3.7+ recommended).  
   - On Windows, download from [python.org](https://www.python.org/downloads/) and ensure “Add Python to PATH” is checked during installation.  
   - On macOS, Python 3 may already be included. Otherwise, install via [python.org](https://www.python.org/downloads/mac-osx/) or [Homebrew](https://brew.sh/).  
   - On Ubuntu/Debian, Python 3 is included by default. If needed, install with `sudo apt install python3 python3-venv`.

2. **pip** (Python’s package installer) is usually included with Python 3.  
   - Verify with `pip --version` (or `pip3 --version`).

---

## 1. Create a Virtual Environment

Below are commands for each OS to create and activate a **virtual environment** named `.venv` in the project root.

### Windows (PowerShell)

```powershell
cd path\to\HandFingers
python -m venv .venv
.venv\Scripts\Activate.ps1
```

If you see an “execution policy” warning, you may need to enable script execution with:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```
Then re‐run the `Activate.ps1` script.

### macOS / Linux (bash/zsh)

```bash
cd ~/Code/HandFingers
python3 -m venv .venv
source .venv/bin/activate
```

Once activated, your shell prompt will typically show `(.venv)` at the start.

> **Note:** If you ever need to deactivate the virtual environment:
> - On Windows: `deactivate`
> - On macOS/Linux: `deactivate`

### Add `.venv` to .gitignore

Make sure the `.venv` directory is **not** committed to version control. Add this line to your `.gitignore` if it isn’t already there:

```
.venv/
```

---

## 2. Install `gdtoolkit`

With the virtual environment **activated**, install **GDToolkit**:

```bash
pip install gdtoolkit
```

(If you want consistent versions across the team, you can run `pip freeze > requirements.txt` and commit that file to Git—but that’s optional.)

---

## 3. Point GDScript Formatter to Your `gdformat`

Because we aren’t using the plugin’s built‐in “Install/Update gdtoolkit” feature, we must manually specify the path to `gdformat` in the plugin’s preferences file.

1. In Godot’s FileSystem panel, open:
   ```
   res://addons/gdscript_formatter/format_preference.tres
   ```
2. In the **Inspector**, find the field named `gdformat_command`.  
3. Change it to the **full path** of your `gdformat` executable in `.venv`. For example:
   - **Windows**: `C:/path/to/HandFingers/.venv/Scripts/gdformat.exe`
   - **macOS/Linux**: `/home/<yourusername>/Code/HandFingers/.venv/bin/gdformat`

*(Note: Adjust the path to match your actual folder structure and username.)*

4. Make sure `format_on_save` is set to **`true`**.  
5. **Save** the file and **restart** Godot.

---

## 4. Verifying Format on Save

- Open any `.gd` script in Godot.  
- Make a formatting change (e.g., add extra spaces or new lines).  
- Press **Ctrl+S** (or Command+S on macOS) to save. The script should reformat automatically (you might see minor text changes or a console message if the plugin logs anything).

You can also manually format by pressing **Shift+Alt+F** (default shortcut) or by going to **Project → Tools → GDScript Formatter → Format script**.

---

## 5. Do I Need to Reactivate the venv Every Time?

- **Inside Godot**: Once `gdformat_command` is set to the absolute path in `.venv`, Godot knows where to find it. You don’t need to worry about re‐activating the venv for the editor’s auto‐format.
- **From the Terminal**: If you ever want to run `gdformat` or `gdlint` manually (e.g., `gdformat my_script.gd`), you need to:
  1. Activate the venv again (`source .venv/bin/activate` on macOS/Linux, or `.venv\Scripts\Activate.ps1` on Windows).
  2. Then run `gdformat my_script.gd`.

---

## Troubleshooting

- **Cannot install gdtoolkit on Linux**: If you see a “externally-managed-environment” error, it means you’re trying to install to the system Python. Use the steps above to install in `.venv` instead.  
- **Permission denied on Windows**: Try opening PowerShell as administrator, or change your execution policy with `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`.  
- **No changes when saving**: Ensure `format_on_save` is `true` in `format_preference.tres` and your `gdformat_command` is correct.

---